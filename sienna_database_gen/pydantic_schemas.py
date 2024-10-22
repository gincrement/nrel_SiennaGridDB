"""Plan:

1. Create a class for each table in the database
2. Create a class for each table in the schema
3. Annotate all columns with SQLAlchemy Column information and table name
4. Create tables with SQLAlchemy Table
5. Use obj_type when parsing to determine how to parse or separate into attributes
"""

from enum import StrEnum
from pydantic import (
    BaseModel,
    Field,
    model_validator,
)
from pydantic.json_schema import GenerateJsonSchema

from typing import Any, ClassVar, Annotated, get_type_hints
from sqlalchemy import Double, ForeignKey, Table, Column, Integer, Text

from R2X_schemas.enums import ACBusTypes, PrimeMoversType, ThermalFuels
from R2X_schemas.units import ApparentPower, Voltage


def get_column_from_annotation(type_hint, name: str):
    if not hasattr(type_hint, "__metadata__"):
        return None
    for annotation in type_hint.__metadata__:
        if isinstance(annotation, Column):
            annotation = annotation.copy()
            if annotation.name is None:
                annotation.name = name
            return annotation
    return None


def create_table(cls, metadata_obj):
    return Table(cls._table_name, metadata_obj, *cls.get_columns())


class SerializableColumn(BaseModel):
    name: str
    type: str
    nullable: bool
    unique: bool
    primary_key: bool

    @classmethod
    def from_column(cls, col: Column):
        return cls(
            name=col.name,
            type=str(col.type),
            nullable=col.nullable,
            unique=col.unique if col.unique is not None else False,
            primary_key=col.primary_key,
        )


class GenerateJSONSchemaWithSQLInfo(GenerateJsonSchema):
    def generate(self, schema, mode="validation"):
        json_schema = super().generate(schema, mode=mode)
        json_schema["table_name"] = schema["schema"]["cls"]._table_name
        json_schema["columns"] = [
            SerializableColumn.from_column(c).model_dump()
            for c in schema["schema"]["cls"].get_columns()
        ]
        return json_schema


class ObjModel(BaseModel):
    id: Annotated[int, Column(Integer, primary_key=True)]
    name: Annotated[str, Column(Text, nullable=False, unique=True)]
    obj_type: Annotated[str, Column(Text, nullable=False)] = "ObjModel"

    @classmethod
    def get_columns(cls):
        cols = [
            get_column_from_annotation(value, key)
            for key, value in get_type_hints(cls, include_extras=True).items()
        ]
        return list(filter(lambda x: x is not None, cols))

    @model_validator(mode="after")
    def set_obj_type(self):
        if self.obj_type == "ObjModel":
            self.obj_type = self.__class__.__name__
        else:
            assert self.obj_type == self.__class__.__name__, "obj_type must match class"
        return self


class GenerationUnit(ObjModel):
    prime_mover: Annotated[PrimeMoversType | None, Column(Text, nullable=True)]
    fuel_type: Annotated[ThermalFuels | None, Column(Text, nullable=True)]
    rating: Annotated[ApparentPower, Column(Double, nullable=False)]
    base_power: Annotated[ApparentPower, Column(Double, nullable=False)]
    _table_name: ClassVar[str] = "generation_unit"


class SupplyTechnology(ObjModel):
    prime_mover: Annotated[PrimeMoversType | None, Column(Text, nullable=True)]
    fuel_type: Annotated[ThermalFuels | None, Column(Text, nullable=True)]
    area_id: Annotated[
        int | None, Column(Integer, ForeignKey("area.id"), nullable=True)
    ]
    balancing_id: Annotated[
        int | None, Column(Integer, ForeignKey("balancing_topology.id"), nullable=True)
    ]
    _table_name: ClassVar[Table] = "supply_technology"


class BalancingTopology(ObjModel):
    area_id: Annotated[
        int | None, Column(Integer, ForeignKey("area.id"), nullable=True)
    ] = None
    _table_name: ClassVar[Table] = "balancing_topology"


class Area(ObjModel):
    _table_name: ClassVar[Table] = "area"


class TransmissionLine(ObjModel):
    from_id: Annotated[
        int | None, Column(Integer, ForeignKey("balancing_topology.id"), nullable=False)
    ]
    to_id: Annotated[
        int | None, Column(Integer, ForeignKey("balancing_topology.id"), nullable=False)
    ]
    rating: Annotated[float, Column(Double, nullable=False)]
    _table_name: ClassVar[Table] = "transmission_line"

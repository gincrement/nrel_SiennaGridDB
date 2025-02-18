function psy2openapi(line::PSY.Line, ids::IDGenerator)
    Line(
        id=getid!(ids, line),
        name=line.name,
        available=line.available,
        active_power_flow=line.active_power_flow * PSY.get_base_power(line),
        reactive_power_flow=line.reactive_power_flow * PSY.get_base_power(line),
        arc=getid!(ids, line.arc),
        r=line.r,
        x=line.x,
        b=get_from_to(line.b),
        rating=line.rating * PSY.get_base_power(line),
        angle_limits=get_min_max(line.angle_limits),
        g=get_from_to(line.g),
    )
end

function psy2openapi(transformer2w::PSY.Transformer2W, ids::IDGenerator)
    Transformer2W(
        id=getid!(ids, transformer2w),
        name=transformer2w.name,
        available=transformer2w.available,
        active_power_flow=transformer2w.active_power_flow *
                          PSY.get_base_power(transformer2w),
        reactive_power_flow=transformer2w.reactive_power_flow *
                            PSY.get_base_power(transformer2w),
        arc=getid!(ids, transformer2w.arc),
        r=transformer2w.r,
        x=transformer2w.x,
        rating=transformer2w.rating * PSY.get_base_power(transformer2w),
        primary_shunt=transformer2w.primary_shunt,
    )
end

function psy2openapi(area_interchange::PSY.AreaInterchange, ids::IDGenerator)
    AreaInterchange(
        id=getid!(ids, area_interchange),
        name=area_interchange.name,
        available=area_interchange.available,
        active_power_flow=area_interchange.active_power_flow *
                          PSY.get_base_power(area_interchange),
        flow_limits=get_fromto_tofrom(
            scale(area_interchange.flow_limits, PSY.get_base_power(area_interchange)),
        ),
        from_area=getid!(ids, area_interchange.from_area),
        to_area=getid!(ids, area_interchange.to_area),
    )
end

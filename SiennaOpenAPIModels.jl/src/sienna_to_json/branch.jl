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

function psy2openapi(transformer::PSY.TapTransformer, ids::IDGenerator)
    TapTransformer(
        id=getid!(ids, transformer),
        name=transformer.name,
        available=transformer.available,
        active_power_flow=transformer.active_power_flow * PSY.get_base_power(transformer),
        reactive_power_flow=transformer.reactive_power_flow *
                            PSY.get_base_power(transformer),
        arc=getid!(ids, transformer.arc),
        r=transformer.r,
        x=transformer.x,
        primary_shunt=transformer.primary_shunt,
        tap=transformer.tap,
        rating=transformer.rating,
    )
end

function psy2openapi(transformer::PSY.PhaseShiftingTransformer, ids::IDGenerator)
    PhaseShiftingTransformer(
        id=getid!(ids, transformer),
        name=transformer.name,
        available=transformer.available,
        active_power_flow=transformer.active_power_flow * PSY.get_base_power(transformer),
        reactive_power_flow=transformer.reactive_power_flow *
                            PSY.get_base_power(transformer),
        arc=getid!(ids, transformer.arc),
        r=transformer.r,
        x=transformer.x,
        primary_shunt=transformer.primary_shunt,
        tap=transformer.tap,
        alpha=transformer.α,
        rating=scale(transformer.rating, PSY.get_base_power(transformer)),
        phase_angle_limits=get_min_max(transformer.phase_angle_limits),
    )
end

function psy2openapi(hvdc::PSY.TwoTerminalHVDCLine, ids::IDGenerator)
    TwoTerminalHVDCLine(
        id=getid!(ids, hvdc),
        name=hvdc.name,
        available=hvdc.available,
        active_power_flow=hvdc.active_power_flow * PSY.get_base_power(hvdc),
        arc=getid!(ids, hvdc.arc),
        active_power_limits_from=get_min_max(
            scale(hvdc.active_power_limits_from, PSY.get_base_power(hvdc)),
        ),
        active_power_limits_to=get_min_max(
            scale(hvdc.active_power_limits_to, PSY.get_base_power(hvdc)),
        ),
        reactive_power_limits_from=get_min_max(
            scale(hvdc.reactive_power_limits_from, PSY.get_base_power(hvdc)),
        ),
        reactive_power_limits_to=get_min_max(
            scale(hvdc.reactive_power_limits_to, PSY.get_base_power(hvdc)),
        ),
        loss=get_two_terminal_loss(hvdc.loss),
    )
end

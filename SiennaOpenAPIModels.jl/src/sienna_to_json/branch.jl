function psy2openapi(line::PSY.Line, ids::IDGenerator)
    Line(
        id = getid!(ids, line),
        name = line.name,
        available = line.available,
        active_power_flow = line.active_power_flow * PSY.get_base_power(line),
        reactive_power_flow = line.reactive_power_flow * PSY.get_base_power(line),
        arc = getid!(ids, line.arc),
        r = line.r,
        x = line.x,
        b = get_from_to(line.b),
        rating = line.rating * PSY.get_base_power(line),
        angle_limits = get_min_max(line.angle_limits),
        g = get_from_to(line.g),
    )
end

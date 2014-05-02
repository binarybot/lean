assert(is_justification(justification()))
assert(justification():is_none())
assert(justification("simple"):is_asserted())
local env = empty_environment()
local f = Const("f")
local g = Const("g")
local a = Const("a")
local j1 = justification("expression must be a type", env, f(f(a)))
assert(j1:is_asserted())
print(j1:pp())
local m  = mk_metavar("m", Bool)
local j2 = justification("expresion must be a Proposition", env, g(m))
print(j2:pp())
local s  = substitution()
s = s:assign(m, f(a))
print(j2:pp(s))
local j3 = assumption_justification(1)
assert(not j2:depends_on(1))
assert(j3:depends_on(1))
assert(not j3:depends_on(2))
local j4 = assumption_justification(2)
assert(j4:depends_on(2))
assert(not j4:depends_on(1))
assert(j4:is_assumption())
assert(not j4:main_expr())
assert(j4:assumption_idx() == 2)
local j5 = mk_composite_justification(mk_composite_justification(j1, j4), j3)
assert(j5:depends_on(1))
assert(j5:depends_on(2))
assert(not j5:depends_on(3))
assert(j5:is_composite())
assert(j5:child2():is_eqp(j3))
assert(j5:child1():child2():is_eqp(j4))

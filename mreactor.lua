local component = require("component")
local rs = component.redstone
local rc = component.reactor_chamber
local thread = require("thread")
local term = require("term")
local sides = require("sides")
local md = component.modem

function Heat()
  local heat = rc.getHeat()
  return heat
end

md.open(1)

while true do
  t1 = thread.create(
  function()
    rheat = Heat()
    md.broadcast(1,"heat",rheat)
  end
  )
  if rheat<9900 then
    rs.setOutput(sides.north,1)
  else 
    rs.setOutput(sides.north,0)
  end
  os.sleep(0.001)
end
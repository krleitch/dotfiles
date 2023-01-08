-- import mind plugin safely
local mind_status, mind = pcall(require, "mind")
if not mind_status then
  return
end

mind.setup()

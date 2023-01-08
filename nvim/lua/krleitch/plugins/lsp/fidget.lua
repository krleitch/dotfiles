-- import fidget plugin safely
local fidget_status, fidget = pcall(require, "fidget")
if not fidget_status then
  return
end

fidget.setup({
  window = {
    relative = "win", -- where to anchor, either "win" or "editor"
    blend = 0, -- &winblend for the window
    zindex = nil, -- the zindex value for the window
  },
})

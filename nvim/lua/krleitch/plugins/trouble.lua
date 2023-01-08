-- import trouble plugin safely
local trouble_status, trouble = pcall(require, "trouble")
if not trouble_status then
  return
end

trouble.setup({
  signs = {
    -- icons / text used for a diagnostic
    error = " ",
    warning = " ",
    hint = " ",
    information = " ",
    other = " ",
  },
})

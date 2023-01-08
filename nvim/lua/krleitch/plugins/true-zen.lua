-- import true-zen plugin safely
local true_zen_status, true_zen = pcall(require, "true-zen")
if not true_zen_status then
  return
end

true_zen.setup()

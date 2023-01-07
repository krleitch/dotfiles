local aerial_setup, aerial = pcall(require, "aerial")
if not aerial_setup then
  return
end

aerial.setup()

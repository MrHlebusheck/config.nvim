function is_dir(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

function is_file(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "file"
end

function read_json(path)
  local fd = io.open(path, 'r')
  local content = fd:read("*a")
  fd:close()
  return vim.fn.json_decode(content)
end

return {
  available = is_dir(".nvim"),
  is_file = is_file,
  read_json = read_json
}

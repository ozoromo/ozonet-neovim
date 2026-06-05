{...}: {
  plugins.leap = {
    enable = true;
  };

  # nixvim removed the `addDefaultMappings` option, so leap is enabled but has
  # no keybindings unless we register them. This restores leap's defaults:
  #   s / S  -> leap forward / backward
  #   x / X  -> leap forward / backward till (visual / operator-pending)
  #   gs     -> leap across windows
  extraConfigLua = ''
    require('leap').add_default_mappings()
  '';
}

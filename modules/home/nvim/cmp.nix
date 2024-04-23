# # Source: https://github.com/hmajid2301/dotfiles/blob/ab7098387426f73c461950c7c0a4f8fb4c843a2c/home-manager/editors/nvim/plugins/coding/cmp.nix
{
  programs.nixvim = {
     options.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      luasnip.enable = true;

        cmp = {
          enable = true;

	  settings = {
	    enable = true;

	    snippet.expand = "luasnip";

	    mapping = {
	      "<C-d>" = "cmp.mapping.scroll_docs(-4)";
	      "<C-f>" = "cmp.mapping.scroll_docs(4)";
	      "<C-Space>" = "cmp.mapping.complete()";
	      "<C-e>" = "cmp.mapping.close()";
	      "<Tab>" = {
		modes = ["i" "s"];
		action = "cmp.mapping.select_next_item()";
	      };
	      "<S-Tab>" = {
		modes = ["i" "s"];
		action = "cmp.mapping.select_prev_item()";
	      };
	      "<CR>" = "cmp.mapping.confirm({ select = true })";
	    };

	    sources = [
	      {name = "path";}
	      {name = "nvim_lsp";}
	      {name = "cmp_tabnine";}
	      {name = "luasnip";}
	      {
		name = "buffer";
		# Words from other open buffers can also be suggested.
		option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
	      }
	      {name = "neorg";}
	    ];
	  };
	};
    };
  };
}

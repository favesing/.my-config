local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 
		"catppuccin/nvim", name = "catppuccin", priority = 1000,
		config = function()
	  	vim.cmd([[colorscheme catppuccin]])
	  end
	},
	{
    'nvim-telescope/telescope.nvim', branch = '0.1.x', 
    dependencies = { 
	    'nvim-lua/plenary.nvim',
	    { 
	    	'nvim-telescope/telescope-fzf-native.nvim', 
	    	build = 'make' 
	    }
    },
    config = function ()
      require('telescope').load_extension('fzf')
    end
  },
  {
    'nvim-tree/nvim-tree.lua', version='*', lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function ()
      require('nvim-tree').setup{}
    end
  },
  {
  	'akinsho/bufferline.nvim', version = '*', 
  	dependencies = {
  		'nvim-tree/nvim-web-devicons'
  	},
  	config = function()
  		require("bufferline").setup{}
  	end
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require('nvim_comment').setup({ create_mappings = false })
		end
	},
	{
		'szw/vim-maximizer'
	},
	{
		'christoomey/vim-tmux-navigator'
	},
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
    	require('lualine').setup()
  	end
	},
	{
	  {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v3.x',
	    lazy = true,
	    config = false,
	    init = function()
	      -- Disable automatic setup, we are doing it manually
	      vim.g.lsp_zero_extend_cmp = 0
	      vim.g.lsp_zero_extend_lspconfig = 0
	    end,
	  },
	  {
	    'williamboman/mason.nvim',
	    lazy = false,
	    config = true,
	  },
	  -- Autocompletion
	  {
	    'hrsh7th/nvim-cmp',
	    event = 'InsertEnter',
	    dependencies = {
	      {'L3MON4D3/LuaSnip'},
	    },
	    config = function()
	      -- Here is where you configure the autocompletion settings.
	      local lsp_zero = require('lsp-zero')
	      lsp_zero.extend_cmp()

	      -- And you can configure cmp even more, if you want to.
	      local cmp = require('cmp')
	      local cmp_action = lsp_zero.cmp_action()

	      cmp.setup({
	        formatting = lsp_zero.cmp_format({details = true}),
	        mapping = cmp.mapping.preset.insert({
	          ['<C-Space>'] = cmp.mapping.complete(),
	          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
	          ['<C-d>'] = cmp.mapping.scroll_docs(4),
	          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
	          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
	        }),
	        snippet = {
	          expand = function(args)
	            require('luasnip').lsp_expand(args.body)
	          end,
	        },
	      })
	    end
	  },
	  -- LSP
	  {
	    'neovim/nvim-lspconfig',
	    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
	    event = {'BufReadPre', 'BufNewFile'},
	    dependencies = {
	      {'hrsh7th/cmp-nvim-lsp'},
	      {'williamboman/mason-lspconfig.nvim'},
	    },
	    config = function()
	      -- This is where all the LSP shenanigans will live
	      local lsp_zero = require('lsp-zero')
	      lsp_zero.extend_lspconfig()
	      local keymap = vim.keymap

	      -- if you want to know more about mason.nvim
	      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
	      lsp_zero.on_attach(function(client, bufnr)
	        -- see :help lsp-zero-keybindings
	        -- to learn the available actions
	        lsp_zero.default_keymaps({buffer = bufnr})

	        -- keybind options
					local opts = { noremap = true, silent = true, buffer = bufnr }
					
					vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>") 
					vim.keymap.set("n", "<leader>gt", "<cmd>Lspsaga peek_type_definition<CR>") 
					vim.keymap.set("n", "<leader>gdd", "<cmd>Lspsaga goto_definition<CR>") 
					vim.keymap.set("n", "<leader>gtt", "<cmd>Lspsaga goto_type_definition<CR>") 
					vim.keymap.set("n", "<leader>gf", "<cmd>Lspsaga finder def+imp+ref<CR>") 
					vim.keymap.set("n", "<leader>gfn", "<cmd>Lspsaga finder def+ref+imp ++normal<CR>")
					vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga show_workspace_diagnostics<CR>") 
					vim.keymap.set("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>") 
					vim.keymap.set("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<CR>") 
					vim.keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>")
					vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
					vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
					vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
					vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
					vim.keymap.set('n', "<leader>tt", "<cmd>Lspsaga term_toggle<CR>")

					-- typescript specific keymaps (e.g. rename file and update imports
					if client.name == "tsserver" then
						vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") 
						vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") 
						vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") 
					end
	      end)

	      require('mason-lspconfig').setup({
	        ensure_installed = {
	        	"html",
				    "tsserver",
				    "cssls",
				    "tailwindcss",
				    "emmet_ls",
				    "lua_ls",
				    "jsonls",
				    "biome",
				    "java_language_server",
				    "groovyls",
				    "golangci_lint_ls",
				    "gopls",
				    "nginx_language_server",
				    "sqlls",
				    "pyright",
	        },
	        handlers = {
	          -- this first function is the "default handler"
	          -- it applies to every language server without a "custom handler"
	          function(server_name)
	            require('lspconfig')[server_name].setup({})
	          end,

	          -- this is the "custom handler" for `lua_ls`
	          lua_ls = function()
	            -- (Optional) Configure lua language server for neovim
	            local lua_opts = lsp_zero.nvim_lua_ls()
	            require('lspconfig').lua_ls.setup(lua_opts)
	          end,
	        }
	      })
	    end
	  }
	},
	{
		'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
	},
	{
		'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
		config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { 
          	"json",
						"javascript",
						"typescript",
						"tsx",
						"yaml",
						"html",
						"css",
						"markdown",
						"markdown_inline",
						"svelte",
						"graphql",
						"bash",
						"lua",
						"vim",
						"dockerfile",
						"gitignore",
          },
          highlight = { enable = true },
          indent = { enable = true }, 
          autotag = { enable = true },
          sync_install = false,
          auto_install = true,
        })
    end
	},
	
}) 
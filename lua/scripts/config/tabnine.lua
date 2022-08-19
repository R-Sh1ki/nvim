local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 50;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = {};
	show_prediction_strength = false;
})

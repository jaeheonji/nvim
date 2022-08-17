require("core.utils").impatient()

-- Run pre-setup hooks
require("core.init").pre_setup()

-- Setup the core configuration
require("core.init").setup()

-- Run post-setup hooks
require("core.init").post_setup()

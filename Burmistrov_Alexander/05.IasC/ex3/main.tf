module gen_config_file {
    source = "./modules/config-files"

    count = length(var.get_env)
    environment = var.get_env[count.index]
    read_password = var.env_pass[count.index]
    path = var.env_path
}
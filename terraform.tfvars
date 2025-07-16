resource_group_name = "my-terraform-rg"
location            = "East US"
app_service_plan_name = "asp-docker-app"
web_app_name          = "webapp-docker-app"
docker_image          = "nginx:latest"


pfx_password = "yourPfxPasswordHere"
resource_prefix = "dev"

app_service_sku        = "B1"
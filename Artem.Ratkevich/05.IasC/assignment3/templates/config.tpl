# Configuration File
# Environment: ${environment}
# Generated at: ${created_at}
# ============================

PET_NAME = "${pet_name}"
API_KEY = "${api_key}"

# Custom Data
%{ for key, value in custom_data ~}
${key} = "${value}"
%{ endfor ~}

import boto3
import json
import os
# Inicializa el cliente SNS
sns_client = boto3.client('sns')

# Reemplaza con el ARN de tu tema SNS
SNS_TOPIC_ARN = os.getenv('SNS_TOPIC_ARN')
                      
def lambda_handler(event, context):
    # Extrae información relevante del evento de Glue
    detail = event.get('detail', {})
    job_name = detail.get('jobName', 'Unknown Job')
    state = detail.get('state', 'Unknown State')
    error_message = detail.get('message', 'No error message provided')

    # Construye un mensaje personalizado
    formatted_message = (
    f"⚠️ *Notificación de Error en Trabajo de AWS Glue* ⚠️\n\n"
    f"🔹 *Nombre del trabajo:* {job_name}\n"
    f"🔹 *Estado:* {state}\n"
    f"🔹 *Mensaje de error:* {error_message}\n\n"
    f"📌 Por favor, revisa el trabajo y corrige el problema.\n\n"
    f"Gracias por tu atención. 🛠️"
)


    # Envía el mensaje al tema SNS
    response = sns_client.publish(
        TopicArn=SNS_TOPIC_ARN,
        Message=formatted_message,
        Subject="AWS Glue Job Failure Alert"
    )

    print(f"Message sent to SNS: {response['MessageId']}")
    return {
        'statusCode': 200,
        'body': json.dumps('Notification sent successfully!')
    }

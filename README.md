# patra_test
Setup Patra Test .
1. Setup Eks clutser over aws then attach worker node to eks cluster.
2. Create patra_app_k8s for k8s manifest file to setup service or run over eks. Dockerfile also there to create image for the same to deploy over eks.
3. Create patra_app_jenkins for Jenkins declarative pipeline to deploy app over k8s using jenkins.
4. Create patra_app_monitoring for monitor url and metrics of patra_app that deploy over k8s.

We setup service with HPA to scale our pod based on CPU utilization and also node scale using cluster autoscaler.
For application Logging we are using aws efs, We mount efs and pod store all logs to efs, This efs we mount over ec2 where my elk pipeline runs so that I can see all the logs to kibana.

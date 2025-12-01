     :::: 🏦 Project: “Banking App – End-to-End DevOps CI/CD with AWS, Docker, Jenkins & Kubernetes (Helm)” ::::
	 
::-> This project is built as a complete End-to-End DevOps solution for the Banking & Finance Domain problem statement provided in the “Banking Domain – DevOps Project.pdf”.

=====> The company in the scenario was struggling with:

            - A monolithic application that was difficult to build & update

		    - Manual deployments, which caused delays and errors

            - Lack of scalable infrastructure

            - No automated CICD pipeline

            - No centralized monitoring or alerts

            - Time-consuming manual server configuration

            - Difficulty rolling out frequent and reliable releases

=====> To solve these challenges, this project implements a fully automated, production-ready DevOps pipeline using modern tools and cloud-native technologies.
::-> The solution covers:

        Infrastructure Automation → Terraform (VPC, Subnets, EC2, Security Groups, EIP)

        Server Configuration Automation → Ansible (Jenkins, Docker, Prometheus, Grafana setup)

        CICD Pipeline → Jenkins (GitHub → Maven → Docker → DockerHub → EC2)

        Containerization → Docker (Application packaged as image)

        Orchestration & Scaling → Kubernetes + Helm

        Monitoring & Alerting → Prometheus + Grafana dashboards & alerts

        Continuous Delivery → Automated Deployments to EC2 + Kubernetes

This project converts the monolithic banking application into a cloud-ready, scalable microservice with fully automated build, test, deploy, and monitoring workflows — exactly solving the real-world problems mentioned in the certification use-case.
  
==> Official Project Scenario Document:-
  Full banking domain case-study is included in the repository:
            Banking Domain – DevOps Project.pdf
<img width="1792" height="1078" alt="run locally" src="https://github.com/user-attachments/assets/a3588d25-93c4-49dc-9658-f1341cedf609" />
<img width="1759" height="1073" alt="locally" src="https://github.com/user-attachments/assets/181ea43d-e229-4398-a3f8-892fa6a20ab6" />


                        ::::====> 1. Project Overview <====::::

::-> This is a real-world Banking System DevOps Implementation where the objective was to:

 - Fully automate application build, test & deployment
 - Use Infrastructure as Code (IaC)
 - Deploy on AWS Cloud
 - Containerize using Docker
 - Implement CI/CD using Jenkins
 - Deploy on Kubernetes using Helm
 - Monitor using Prometheus + Grafana
 - Follow complete DevOps lifecycle end-to-end

::-> The application provides banking operations such as:

 - Funds Management
 - Login
 - Debit & Credit Cards
 - Deposit & Withdraw
 - Transaction management
 - Investment Banking etc.

::-> This project replicates how a real company deploys production systems using DevOps.

                       ::::====> 2. Tools & Technologies Used <====::::
											 
	                         Category                        Tools                                
                |----------------------------- | --------------------------------|
                    | Source Control           | Git, GitHub                          
                    | Build                    | Maven                                
                    | CI/CD                    | Jenkins (Master + Agent)             
                    | Containers               | Docker, DockerHub                    
                    | Cloud                    | AWS EC2, Elastic IP, Security Groups 
                    | IaC                      | Terraform                            
                    | Configuration Management | Ansible                              
                    | Orchestration            | Kubernetes (RKE2 / K3s)              
                    | Packaging                | Helm                                 
                    | Monitoring               | Prometheus, Node Exporter, Grafana   
                    | OS                       | Ubuntu & MacOS                       

                        ::::====> Architecture Diagram <====::::

 <img width="1433" height="596" alt="image" src="https://github.com/user-attachments/assets/60e9c48d-4a94-438f-b8c4-ab936390b0ea" />

                 ::::-> 4. Terraform – AWS Infrastructure Automation <====::::

 ::-> Terraform created:

   . 1 VPC
	
   . 2 Public Subnets
	
   . Security Group
	
   . 4 Elastic IPs
	
   . 4 EC2 Instances & 1 instance manually create for K8s server
              - Jenkins Master
              - Jenkins Agent
              - App Server
              - Monitoring Server
	          - K8s Server (Mannually Create after Complete docker and jenkins) 
<img width="1792" height="1120" alt="Terraform apply" src="https://github.com/user-attachments/assets/0a508576-973d-47d8-89fc-ba3597830f0a" />
<img width="1792" height="1120" alt="output" src="https://github.com/user-attachments/assets/7ec4b13e-0be5-4548-ba77-43a93a1b7d5a" />
<img width="1792" height="1080" alt="Instance pic" src="https://github.com/user-attachments/assets/ced4b3ca-4d9a-4e28-a99e-c1278cb52236" />
<img width="1787" height="1069" alt="Dashboard pic" src="https://github.com/user-attachments/assets/cbdd8ea9-e94d-40c0-b9ed-0171197639f3" />
<img width="1791" height="1069" alt="subnet" src="https://github.com/user-attachments/assets/5dfcc5c4-bb3d-4ea4-a5fa-3956001c8173" />
<img width="1792" height="1076" alt="security group" src="https://github.com/user-attachments/assets/51532811-aa89-4fd6-ab18-5ee5df094ed8" />
<img width="1792" height="1120" alt="ssh-1" src="https://github.com/user-attachments/assets/f37f6193-d572-4be3-803e-9cacfd2a118c" />
<img width="1792" height="1120" alt="ssh-2" src="https://github.com/user-attachments/assets/a2e32ba4-2d9e-46f7-9495-ad7efc251188" />


::-> Important Commands Use For Terraform .                                                                                     
               terraform init                          
               terraform plan
               terraform apply 
               terraform destroy 
          
 ::-> Key Fixes
   - AZ issue fixed (us-west-1b unsupported)
   - KeyPair NotFound error resolved
 

                ::::====> 5. Ansible – Configuration Automation <====::::

	==> Automated installation for:

         - Jenkins Master
         - Jenkins Agent
         - Java 11
         - Docker
         - Node Exporter
         - Prometheus
         - Grafana

 ::-> Example Command:
        ansible-playbook -i inventory jenkins-master.yml
		ansible-playbook -i inventory jenkins-agent.yml
		ansible-playbook -i inventory docker-setup.yml
        ansible-playbook -i inventory monitoring-prometheus.yml etc.

<img width="1792" height="1120" alt="inventory ping output" src="https://github.com/user-attachments/assets/8d2ea399-6bf1-491e-81eb-c4244be46b43" />
<img width="1792" height="1120" alt="jenkins master" src="https://github.com/user-attachments/assets/73a1f4ea-74e7-467a-bfcf-21c178fc988c" />
<img width="1792" height="1120" alt="jenkins agent playbook" src="https://github.com/user-attachments/assets/462b4b81-719f-496d-94f6-dff75336224d" />
<img width="1792" height="1120" alt="Docker setup" src="https://github.com/user-attachments/assets/c449200e-face-4347-b579-e28ef55a3997" />
<img width="1792" height="1120" alt="nodeexpoter" src="https://github.com/user-attachments/assets/29e063b1-88b9-435e-99c0-5b500fbd7ac2" />
<img width="1792" height="1120" alt="prometheus" src="https://github.com/user-attachments/assets/05d765b1-2fbc-470c-8730-1e565abed26f" />
<img width="1792" height="1120" alt="Grafana" src="https://github.com/user-attachments/assets/fcce6a93-240e-47d1-9363-3d648e33f649" />

   ::::===> Application Local Testing (Before Dockerization)
             - Before building the Docker image, the Spring Boot application was tested locally to ensure it runs correctly.

  Commands used:-
   ./mvnw clean package
   java -jar target/banking-0.0.1-SNAPSHOT.jar
            - The app successfully started on port 8082, confirming the build was stable before containerization.
			
<img width="1792" height="1078" alt="run locally" src="https://github.com/user-attachments/assets/b5eada44-11f1-4a3c-b2d4-d1eb6762cadd" />
<img width="1792" height="1120" alt="spring but run" src="https://github.com/user-attachments/assets/63f78fbf-f6cc-4e35-9024-e4c1cb7b97a8" />

                  :::::====> 6. Docker – Containerization <====:::::

====> Dockerfile:
      Base Image: eclipse-temurin:11-jdk
      Copies JAR
      Exposes port 8082
      ENTRYPOINT: java -jar app.jar	

====> Important Commands:
        docker build -t banking-app .
        docker run -p 8080:8082 banking-app
        docker tag banking-app username/banking-app
        docker push username/banking-app
		
<img width="1792" height="1120" alt="docker build and run port no" src="https://github.com/user-attachments/assets/10c614a0-351a-4144-b890-1a92da165d71" />
![Screenshot 2025-11-25 at 4 23 03 PM](https://github.com/user-attachments/assets/9968c43a-bf6a-4930-906f-a65b11fcbb11)
<img width="1783" height="1076" alt="run url in docker ip" src="https://github.com/user-attachments/assets/f9d0f0aa-a824-4c18-a34e-a616a24b523f" />
<img width="1766" height="299" alt="docker" src="https://github.com/user-attachments/assets/2c762b9d-56f6-45c7-ab57-6954fdfc85ca" />
<img width="1792" height="499" alt="Screenshot 2025-11-26 at 1 07 40 PM" src="https://github.com/user-attachments/assets/a1e224c5-a6b4-4af4-9bfa-8a977336877a" />
<img width="1792" height="1120" alt="Screenshot 2025-11-25 at 4 38 19 PM" src="https://github.com/user-attachments/assets/a13d1dd9-d7e0-4536-8972-a150f7f07d88" />

                   ::::====> 7. CI/CD – Jenkins Pipeline <====::::

====>  Pipeline Stages:
          
		1.Checkout Code → GitHub
		
        2.Maven Build → Create JAR
		
        3.Docker Build → Build image
		
        4.DockerHub Push
		
        5.EC2 Deployment (Docker container)
		
        6.Deployment to Kubernetes via Helm
		
        7.Email Notification

====> Key Features:
        - Webhooks from GitHub

        - Jenkins agent for builds

        - Docker socket permission fix

        - SSH private key permissions fix

        - Automatic deployment on code change
		
<img width="1785" height="1039" alt="jenkins pic 1" src="https://github.com/user-attachments/assets/2b68c85b-1a66-4bc2-b25a-d72de7f6082f" />
<img width="1788" height="1069" alt="pic -2" src="https://github.com/user-attachments/assets/ebbfb0d1-0195-401a-aab8-f98dff891614" />
<img width="1783" height="1073" alt="pic -3" src="https://github.com/user-attachments/assets/6c87bdf6-c78e-4ce1-b18f-a8fd9afb5aae" />
<img width="1781" height="1076" alt="creditnal" src="https://github.com/user-attachments/assets/2253295d-6c5f-4dc5-bd60-848506c76d8f" />
<img width="1786" height="1063" alt="pic -3" src="https://github.com/user-attachments/assets/333ed095-ce45-4888-a190-60913994f440" />
<img width="1787" height="1068" alt="ajent " src="https://github.com/user-attachments/assets/de768ddf-24f4-46d4-94be-5d271a8648f9" />
![ajent-2](https://github.com/user-attachments/assets/cf2fc367-9b9e-4c9c-b658-d223f8b051ef)
<img width="1792" height="1078" alt="wavehook" src="https://github.com/user-attachments/assets/b25678ba-aa03-4b64-bbfc-4adc2c2b9ed2" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 4 30 18 PM" src="https://github.com/user-attachments/assets/1ee3970d-81c1-46c4-8158-56ab5c3dc286" />
<img width="1790" height="1078" alt="grafh" src="https://github.com/user-attachments/assets/6f4a3cdb-a48e-4c06-b2dc-7886b7be526f" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 52 07 PM" src="https://github.com/user-attachments/assets/6b335a64-4820-4bc1-bd69-4469ad3e600d" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 52 00 PM" src="https://github.com/user-attachments/assets/9abfdae7-8ea0-4f5b-b1f9-50fe4ac71775" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 52 27 PM" src="https://github.com/user-attachments/assets/a5d9317a-8f1c-4ff8-b019-42d8ec5edbd3" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 54 01 PM" src="https://github.com/user-attachments/assets/0c7e20d1-35ae-4970-84a1-cf712cabc95b" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 54 20 PM" src="https://github.com/user-attachments/assets/350e7ab7-7980-48c9-af7f-cf42af04fcba" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 55 42 PM" src="https://github.com/user-attachments/assets/da01c3ea-dfe2-43d2-9473-bb58fabc5e75" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 12 56 06 PM" src="https://github.com/user-attachments/assets/e7cce1ce-e5e1-4764-ae85-15fc28429e6b" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 2 12 07 PM" src="https://github.com/user-attachments/assets/fe74983c-ef7e-4c6c-87dc-a44f8e9724e0" />


               :::::====> 8. Monitoring – Prometheus & Grafana <=====::::

	====> Prometheus:

           - Node exporter metrics

           - Prometheus scraping node exporter & app

   ====> Grafana:

            - Added Prometheus as datasource

            - Created CPU/Memory dashboards

            - Custom queries configured
			
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 3 06 44 PM" src="https://github.com/user-attachments/assets/5ed57806-a487-41c7-a4cf-c2d8034fe51d" />
<img width="1792" height="1120" alt="Screenshot 2025-11-26 at 3 15 27 PM" src="https://github.com/user-attachments/assets/2b606d53-2657-4d79-ae5e-9ffb172b55f8" />
<img width="1785" height="1038" alt="Screenshot 2025-11-26 at 4 27 55 PM" src="https://github.com/user-attachments/assets/c1fd0e6f-47e9-4c32-b4e7-f62c6552e326" />
<img width="1792" height="1078" alt="Screenshot 2025-11-26 at 4 37 31 PM" src="https://github.com/user-attachments/assets/8f638e21-b1a2-434e-93f1-013618e20457" />
<img width="1789" height="1058" alt="Screenshot 2025-11-26 at 4 37 37 PM" src="https://github.com/user-attachments/assets/7f303b15-3a7e-4757-afe5-db18dfb00226" />
<img width="1792" height="1075" alt="Screenshot 2025-11-26 at 4 37 45 PM" src="https://github.com/user-attachments/assets/9bb97c2b-2dad-4690-9f2d-99847266ead1" />


                  ::::====> 8. Kubernetes + Helm Deployment <====::::

====> K8s Setup:

       -Kubernetes installed on EC2

       - kubectl configured

       - Helm v3 installed

====> Helm Chart Structure:
         Chart.yaml
         values.yaml
         templates/
             deployment.yaml
             service.yaml

====> Deployment Command:
        helm upgrade --install banking-app ./


====> Results:
        - Pod Running

        - Service NodePort (30080)

        - Application accessible at:

	====> http://54.215.183.246:30080
	
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 12 06 16 PM" src="https://github.com/user-attachments/assets/4ed45989-1c41-4e15-8100-9d92a7647adf" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 12 04 43 PM" src="https://github.com/user-attachments/assets/9583bf2f-80b4-4a64-9009-f45b9b0a09fc" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 1 23 57 PM" src="https://github.com/user-attachments/assets/6b7f1db8-550b-4919-9864-4779d0467697" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 1 24 08 PM" src="https://github.com/user-attachments/assets/faa7b9e0-095d-437c-aede-7c286dc5bd98" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 2 12 07 PM" src="https://github.com/user-attachments/assets/2843da6e-cc13-461f-b2fd-65f1401bda7c" />

====> terraform distroy:

<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 2 22 31 PM" src="https://github.com/user-attachments/assets/699c4e27-fc94-4e28-a33b-68f06128bc65" />
<img width="1792" height="1120" alt="Screenshot 2025-11-27 at 2 18 52 PM" src="https://github.com/user-attachments/assets/81b38cf4-ee30-4281-8e73-4825f7ac9da7" />


                 ::::====> 10. End-to-End DevOps Pipeline Flow <====::::

		1 Developer pushes code → GitHub

        2 Webhook triggers Jenkins

        3 Jenkins agent builds app & Docker image

        4 Jenkins pushes image → DockerHub

        5 Jenkins deploys Docker container → EC2

        6 Jenkins deploys to Kubernetes → Helm

        7 Monitoring via Prometheus → Grafana

        8 Alerts / Dashboard visible in Grafana




	


	   
                                                                        Madhav Jha







			






















		







  


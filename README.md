         :::: 🏦 Project: “Banking App – End-to-End DevOps CI/CD with AWS, Docker, Jenkins & Kubernetes (Helm)” ::::
::-> This project demonstrates a **real-world Banking Domain Application** automated with a full DevOps workflow. From source code → CI/CD → Dockerization → Cloud Deployment → Kubernetes (Helm) → Monitoring  every stage has been            implemented exactly like a production-grade setup.
  
==> Official Project Scenario Document:-
  Full banking domain case-study is included in the repository:
            Banking Domain – DevOps Project.pdf


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

  1 VPC
	
  2 Public Subnets
	
  3 Security Group
	
  4 Elastic IPs
	
  5 EC2 Instances
    -Jenkins Master
    -Jenkins Agent
    -App Server
    -Monitoring Server

<img width="1792" height="1120" alt="Terraform apply" src="https://github.com/user-attachments/assets/0a508576-973d-47d8-89fc-ba3597830f0a" />
<img width="1792" height="1120" alt="output" src="https://github.com/user-attachments/assets/7ec4b13e-0be5-4548-ba77-43a93a1b7d5a" />
<img width="1792" height="1080" alt="Instance pic" src="https://github.com/user-attachments/assets/ced4b3ca-4d9a-4e28-a99e-c1278cb52236" />
<img width="1787" height="1069" alt="Dashboard pic" src="https://github.com/user-attachments/assets/cbdd8ea9-e94d-40c0-b9ed-0171197639f3" />
<img width="1791" height="1069" alt="subnet" src="https://github.com/user-attachments/assets/5dfcc5c4-bb3d-4ea4-a5fa-3956001c8173" />
<img width="1787" height="1069" alt="Dashboard pic" src="https://github.com/user-attachments/assets/46c4ce6e-0cb4-48a8-b294-a9106f63e3b9" />
<img width="1792" height="1120" alt="inventory ping output" src="https://github.com/user-attachments/assets/38c1344d-210d-4134-ab2a-02ad242c7993" />








  


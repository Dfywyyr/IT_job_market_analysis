#install.packages("readr")
library(readr)

# load csv
data <- read.csv("JobsDataset.csv")

# filter data to only JUNIOR / JR positions
filtered_data <- data %>% filter(grepl("\\b(Junior|Jr)\\b", `Job.Title`, ignore.case = TRUE))

# visualize new data
head(filtered_data)

# Export junior jobs with technical skills to a CSV
write_csv(filtered_data, "Filtered_data")



# define a vector of technical skills
technical_skills <- c("Python", "Java", "JavaScript", "R", "C#", "C\\+\\+", "Ruby", "PHP", "Swift", "Go", "Kotlin", "MATLAB", "Scala", "Perl", "Lua", "TypeScript", "VHDL", "Assembly", 
                      "Objective-C", "Solidity", "Rust", "Dart", "C", "F#", "Visual Basic", "Elixir", "HTML5", "CSS3", "JavaScript \\(ES6\\+\\)", "React.js", "Vue.js", "Angular", "Svelte", 
                      "Ember.js", "Bootstrap", "jQuery", "Node.js", "Express.js", "Webpack", "Babel", "SASS", "Tailwind CSS", "Pug", "Gulp", "Grunt", "EJS", "JSP", "Handlebars", "Django", "Flask", "Spring Boot", "Ruby on Rails", "ASP.NET", "Laravel", "Express.js", 
                      "Phoenix Framework", "NestJS", "FastAPI", "Symfony", "CodeIgniter", "Yii", "Zend Framework", "MySQL", "PostgreSQL", "MongoDB", "SQLite", "Oracle Database", "NoSQL", "Redis", "Cassandra", "CouchDB", "ElasticSearch", "MariaDB", "Apache Hive", "Apache HBase", 
                      "Google BigQuery", "Amazon RDS", "DynamoDB", "Firebase", "SQLite", "GraphQL", "Git", "GitHub", "GitLab", "Bitbucket", "Subversion", "Mercurial", "Perforce", "TFS", "AWS \\(Amazon Web Services\\)", "Google Cloud Platform", "Microsoft Azure", "IBM Cloud", "Heroku", "DigitalOcean", "Alibaba Cloud", "Oracle Cloud", "Salesforce", "OpenStack", "Kubernetes", "Docker", "Terraform", "Ansible", "Jenkins", "CI/CD", "CloudFormation", "Elastic Beanstalk", "Cloud Run", "Lambda", "Google App Engine", "Azure Functions", "Linux", "Ubuntu", "CentOS", "Red Hat", "Debian", "Windows", "macOS", "Unix", "Android", "iOS", "Raspberry Pi", "Chrome OS", "FreeBSD", "Solaris", "Docker Containers", "Docker", "Kubernetes", "Jenkins", "Ansible", "Terraform", "Vagrant", "Chef", "Puppet", "CircleCI", "Travis CI", "Octopus Deploy", "Bamboo", "TeamCity", "GitLab CI", "Selenium", "Pandas", "NumPy", "Matplotlib", "Seaborn", "ggplot2", "Plotly", "D3.js", "Power BI", "Tableau", "Excel", "Jupyter Notebook", "RStudio", "SciPy", "Hadoop", "PySpark", 
                      "Machine Learning", "Deep Learning", "Scikit-learn", "XGBoost", "Keras", "TensorFlow", "PyTorch", "MLflow", "JupyterLab", "Apache Kafka", "Snowflake", "Google Analytics", 
                      "R Shiny", "Kaggle", "Data Wrangling", "ETL", "BigQuery", "SQL", "NoSQL", "SQL Server", "MongoDB", "GraphQL", "Data Visualization", "Data Cleaning", "Data Mining", "Data Warehousing", 
                      "Algorithm Design", "Linear Regression", "Logistic Regression", "Clustering", "Classification", "Android", "Kotlin", "Java for Android", "Swift", "Objective-C", "iOS", "React Native", 
                      "Flutter", "Xamarin", "PhoneGap", "Cordova", "Ionic", "Firebase", "Xcode", "Android Studio", "TensorFlow", "Keras", "PyTorch", "Scikit-learn", "OpenCV", "Natural Language Processing", 
                      "Deep Learning", "Reinforcement Learning", "Neural Networks", "Artificial Intelligence", "Computer Vision", "Speech Recognition", "Face Recognition", "Object Detection", 
                      "Generative Adversarial Networks", "AI Ethics", "Transfer Learning", "AutoML", "Firewall", "Encryption", "Penetration Testing", "Vulnerability Scanning", "IDS/IPS", 
                      "SSL/TLS", "OAuth", "PKI", "DDoS Protection", "Network Security", "Ethical Hacking", "OWASP", "Cryptography", "SIEM", "CISSP", "Risk Assessment", "Two-Factor Authentication", "TCP/IP", "DNS", "HTTP/HTTPS", "FTP", "VPN", "SSH", "Wireshark", "Ping", "Traceroute", 
                      "Load Balancing", "Reverse Proxy", "TCP", "UDP", "Sockets", "Networking Protocols", "Unit Testing", "Integration Testing", "System Testing", "Functional Testing", "Load Testing", 
                      "Selenium", "JUnit", "TestNG", "Cypress", "Mocha.js", "Chai", "Jest", "Postman", "Mockito", "Jenkins", "Test Automation", "Behavior-Driven Development \\(BDD\\)", "TDD", "JSON", "XML", "YAML", "CSV", "Regular Expressions", "SOAP", "REST", "GraphQL", 
                      "Web Scraping", "Scrapy", "BeautifulSoup", "Automation", "Shell Scripting", "Bash", "PowerShell", "Vim", "Emacs", "VS Code", "PyCharm", "IntelliJ IDEA", "Eclipse", "NetBeans", "Xcode",  "Figma", "Sketch", "Photoshop", "Illustrator", "Adobe XD", "Wireframing", "Prototyping", "Jira", 
                      "Trello", "Asana", "Basecamp", "Monday.com", "Slack", "Microsoft Teams", "Zoom", "Notion", "Confluence", "Agile", "Scrum", "Kanban", "DevOps", "CI/CD", "Microservices", "Blockchain", 
                      "IoT", "5G", "Edge Computing", "Blockchain", "Ethereum", "Solidity", "Smart Contracts")

# define a vector of soft skills
soft_skills <- c("communication", "teamwork", "problem solving", "adaptability", "critical thinking", "creativity", "time management", "leadership", "collaboration", "interpersonal skills", "empathy", "organization", "conflict resolution", 
                    "public speaking", "decision making", "active listening","self-motivation", "flexibility", "emotional intelligence", 
                    "negotiation", "stress management", "resilience","coaching", "presentation skills", "customer service", 
                    "project management", "negotiation skills", "mentoring","networking", "responsibility", "work ethic", "confidentiality", 
                    "positive attitude", "analytical skills", "assertiveness","attention to detail", "multitasking", "delegation", 
                    "influencing others", "team building", "self-awareness","conflict management", "persuasion", "listening skills", 
                    "trustworthiness", "strategic thinking", "goal setting","accountability", "relationship building", "feedback acceptance", 
                    "learning agility", "self-confidence", "open-mindedness","decision making", "patience", "interpersonal communication", 
                    "change management", "work-life balance", "cultural awareness","positive reinforcement", "emotional regulation", 
                    "motivation", "clarity", "innovation", "collaborative mindset","adaptability to change", "task prioritization", "resource management", 
                    "self-discipline", "delegation", "self-management","cross-functional collaboration", "problem-solving mindset", 
                    "client relationship management", "technical documentation","mentoring skills", "technical support", "time optimization", 
                    "client-oriented mindset", "critical reasoning","knowledge sharing", "technical training", "risk management", 
                    "knowledge transfer", "quality assurance", "data-driven decision making","process improvement", "collaborative problem solving", "productivity tools", 
                    "task automation", "cloud computing collaboration", "cybersecurity awareness","change adoption", "customer-oriented problem solving", "agile methodologies", 
                    "scrum facilitation", "software release management", "version control","project delivery", "continuous learning", "conflict resolution", 
                    "strategic IT planning", "IT policy development", "efficiency optimization","data visualization", "systems analysis", "team coordination", 
                    "technical troubleshooting", "technology integration", "system design","business analysis", "cross-departmental communication", 
                    "data security best practices", "software deployment", "team leadership","data-driven strategies", "technical troubleshooting", "user experience focus", 
                    "cross-functional team management", "collaborative development", "risk mitigation")

# ------------------------ TECHNICAL SKILLS CODE RELATED -------------------------------

job_descriptions <- filtered_data$Description

# Function to count technical skills in job descriptions
count_skills <- function(job_descriptions, technical_skills) {
  skill_counts <- sapply(technical_skills, function(skill) {
    sum(sapply(job_descriptions, function(description) {
      grepl(skill, description, ignore.case = TRUE)
    }))
  })
  return(skill_counts)
}

# Count technical skills in each job description
skill_counts <- count_skills(job_descriptions, technical_skills)

# Create a data frame with the results
result_df <- data.frame(Skill = technical_skills, Count = skill_counts)

# Save the result to a CSV file
write_csv(result_df, "skill_counts.csv")

# Print the result
print(result_df)


# ------------------------------- SOFT SKILLS CODE RELATED ----------------------------------

# Function to count soft skills in job descriptions
count_skills <- function(job_descriptions, skills) {
  skill_counts <- sapply(skills, function(skill) {
    sum(sapply(job_descriptions, function(description) {
      grepl(skill, description, ignore.case = TRUE)
    }))
  })
  return(skill_counts)
}

# Count soft skills in each job description
soft_skill_counts <- count_skills(job_descriptions, soft_skills)

# Create a data frame with the results
soft_skill_result_df <- data.frame(Skill = soft_skills, Count = soft_skill_counts)

# Save the result to a CSV file
write_csv(soft_skill_result_df, "soft_skill_counts.csv")

# Print the result
print(soft_skill_result_df)




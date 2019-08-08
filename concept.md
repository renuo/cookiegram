# :cookie: Core Concept

## Models

Post  
— timestamp: date  
— description: string  
— cookies: Cookie[]  
— image: string (url)  
— comments: Comment[]   
— user: User

User  
— username: string (alphanumeric)  
— email: string (valid email)  
— password: string (hash)  
— posts: Post  
— description: string  
— image: string (url)  

Cookie  
— timestamp: date  
— user: User  
— post: Post  

Comment  
— timestamp: date  
— message: string  
— post: Post  
— user: User  

## Milestones
- Implement basic application logic (models and controllers)
- Implement image upload logic
- Styling

# Random notes
Use 'device' for login
Maybe consider 'AWS s3'
Use 'carrierwave' as image form handler

rails generate model Post description:text image:string
rails generate model User email:string username:string password:string description:text
rails generate model User email:string username:string password:string description:text
INSERT INTO [dbo].[Users]
           ([email]
           ,[enabled]
           ,[name]
           ,[password]
           ,[role]
           ,[username])
     VALUES
           ('admin@pucminas.br'
           ,'1'
           ,'Administrador'
           ,'pucminas'
           ,'ROLE_ADMIN'
           ,'admin');
           
INSERT INTO [dbo].[Users]
           ([email]
           ,[enabled]
           ,[name]
           ,[password]
           ,[role]
           ,[username])
     VALUES
           ('user1@pucminas.br'
           ,'1'
           ,'User 1'
           ,'pucminas'
           ,'ROLE_USER'
           ,'user1');	
           
INSERT INTO [dbo].[Users]
           ([email]
           ,[enabled]
           ,[name]
           ,[password]
           ,[role]
           ,[username])
     VALUES
           ('user2@pucminas.br'
           ,'1'
           ,'User 2'
           ,'pucminas'
           ,'ROLE_USER'
           ,'user2');

           
INSERT INTO [dbo].[Post]
           ([data]
           ,[texto]
           ,[titulo]
           ,[autor_id])
     VALUES
           ('01/01/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?'
           ,'Primeira Postagem'
           ,2);

INSERT INTO [dbo].[Post]
           ([data]
           ,[texto]
           ,[titulo]
           ,[autor_id])
     VALUES
           ('01/02/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?'
           ,'Segunda Postagem'
           ,2);

INSERT INTO [dbo].[Post]
           ([data]
           ,[texto]
           ,[titulo]
           ,[autor_id])
     VALUES
           ('01/03/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?'
           ,'Terceira Postagem'
           ,3);

INSERT INTO [dbo].[Post]
           ([data]
           ,[texto]
           ,[titulo]
           ,[autor_id])
     VALUES
           ('01/04/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?'
           ,'Quarta Postagem'
           ,3);

INSERT INTO [dbo].[Comment]
           ([data]
           ,[texto]
           ,[thumbsDown]
           ,[thumbsUp]
           ,[post_id])
     VALUES
           ('01/01/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
           ,0
           ,0
           ,1);
           
INSERT INTO [dbo].[Comment]
           ([data]
           ,[texto]
           ,[thumbsDown]
           ,[thumbsUp]
           ,[post_id])
     VALUES
           ('02/01/2017'
           ,'Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe.'
           ,0
           ,0
           ,1);
           
INSERT INTO [dbo].[Comment]
           ([data]
           ,[texto]
           ,[thumbsDown]
           ,[thumbsUp]
           ,[post_id])
     VALUES
           ('03/01/2017'
           ,'Quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?'
           ,0
           ,0
           ,1);
           
INSERT INTO [dbo].[Comment]
           ([data]
           ,[texto]
           ,[thumbsDown]
           ,[thumbsUp]
           ,[post_id])
     VALUES
           ('04/01/2017'
           ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
           ,0
           ,0
           ,1);




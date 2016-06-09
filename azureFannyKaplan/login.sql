
CREATE TABLE [dbo].[login] (
    [user_id]  INT           IDENTITY (1, 1) NOT NULL,
    [username] NVARCHAR (50) NULL,
    [pwd]      NVARCHAR (50) NULL,
    CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED ([user_id] ASC)
);

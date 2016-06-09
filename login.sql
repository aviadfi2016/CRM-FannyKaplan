﻿SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[login](
          [user_id] [int] IDENTITY(1,1) NOT NULL,
          [username] [nvarchar](50) NULL,
          [pwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED
(
          [user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
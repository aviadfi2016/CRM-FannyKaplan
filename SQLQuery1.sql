SET ANSI_NULLS ON
GO
 
SET QUOTED_IDENTIFIER ON
GO
 
SET ANSI_PADDING ON
GO
 
CREATE TABLE [dbo].[tblCustomers](
[CustomerID] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NULL,
[Taz] [nvarchar](9) NULL,
[DOB] [nvarchar](50) NULL,
[Age] [nvarchar](50) NULL,

[PhoneNumber] [nvarchar](10) NULL,
[MobilePhone] [nvarchar](50) NULL,
[Address] [nvarchar](200) NULL,
[Email] [nvarchar](50) NULL,
[Klass] [nvarchar](50) NULL,
[Office] [nvarchar](50) NULL,
[Date] [nvarchar](50) NULL,
[Worker] [nvarchar](50) NULL,
[Status] [nvarchar](50) NULL,
      [IsActive] [bit] NULL,
 CONSTRAINT [PK_tblCustomers] PRIMARY KEY CLUSTERED
(
      [CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
 
GO
 
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tblInter] (
    [CustomerID]    INT            IDENTITY (1, 1) NOT NULL,
    [Klass]         NVARCHAR (50)  NULL,
    [ddl_type_user] NVARCHAR (50)  NULL,
    [FavDays]       NVARCHAR (50)  NULL,
	[dll_KlassTime] NVARCHAR (50)  NULL,
    [Age]           NVARCHAR (50)  NULL,
    [FirstName]     NVARCHAR (50)  NULL,
    [LastName]      NVARCHAR (50)  NULL,
    [PhoneNumber]   NVARCHAR (10)  NULL,
    [MobilePhone]   NVARCHAR (50)  NULL,
    [Address]       NVARCHAR (200) NULL,
    [Email]         NVARCHAR (50)  NULL,
    [Ways]          NVARCHAR (50)  NULL,
    [Comments]      NVARCHAR (50)  NULL,
    [Date]          NVARCHAR (50)  NULL,
    [Worker]        NVARCHAR (50)  NULL,
    [IsActive]      BIT            NULL,
    CONSTRAINT [PK_tblInter] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


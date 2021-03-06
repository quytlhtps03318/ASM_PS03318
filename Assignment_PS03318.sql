-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-10-16 09:18:18.283

-- tables
-- Table: HoaDon

use Assignment_PS03318
go

CREATE TABLE HoaDon (
    MaHD varchar(10)  NOT NULL,
    NgayLapHD date  NOT NULL,
    TenCongTy varchar(50)  NOT NULL,
    HoaDon_MaHD varchar(10)  NOT NULL,
    Khach_Hang_MaKH varchar(10)  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (MaHD)
);

-- Table: HoaDonCT
CREATE TABLE HoaDonCT (
    SoLuong int  NOT NULL,
    MaHD varchar(10)  NOT NULL,
    MaSP varchar(10)  NOT NULL,
    HoaDon_MaHD varchar(10)  NOT NULL,
    SanPham_MaSP varchar(10)  NOT NULL,
    CONSTRAINT HoaDonCT_pk PRIMARY KEY  (MaHD,MaSP)
);

-- Table: Khach_Hang
CREATE TABLE Khach_Hang (
    MaKH varchar(10)  NOT NULL,
    HoTen varchar(50)  NOT NULL,
    DiaChi varchar(100)  NOT NULL,
    SoDienThoai int  NOT NULL,
    Email varchar(50)  NOT NULL,
    CONSTRAINT Khach_Hang_pk PRIMARY KEY  (MaKH)
);

-- Table: LoaiSP
CREATE TABLE LoaiSP (
    MaLoaiSP varchar(10)  NOT NULL,
    TenLoanSP varchar(40)  NOT NULL,
    CONSTRAINT LoaiSP_pk PRIMARY KEY  (MaLoaiSP)
);

-- Table: SanPham
CREATE TABLE SanPham (
    MaSP varchar(10)  NOT NULL,
    TenSP nvarchar(30)  NOT NULL,
    DonGia int  NOT NULL,
    DonViTinh varchar(10)  NOT NULL,
    LoaiSP_MaLoaiSP varchar(10)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (MaSP)
);

-- foreign keys
-- Reference: HoaDonCT_HoaDon (table: HoaDonCT)
ALTER TABLE HoaDonCT ADD CONSTRAINT HoaDonCT_HoaDon
    FOREIGN KEY (HoaDon_MaHD)
    REFERENCES HoaDon (MaHD);

-- Reference: HoaDonCT_SanPham (table: HoaDonCT)
ALTER TABLE HoaDonCT ADD CONSTRAINT HoaDonCT_SanPham
    FOREIGN KEY (SanPham_MaSP)
    REFERENCES SanPham (MaSP);

-- Reference: HoaDon_Khach_Hang (table: HoaDon)
ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_Khach_Hang
    FOREIGN KEY (Khach_Hang_MaKH)
    REFERENCES Khach_Hang (MaKH);

-- Reference: SanPham_LoaiSP (table: SanPham)
ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSP
    FOREIGN KEY (LoaiSP_MaLoaiSP)
    REFERENCES LoaiSP (MaLoaiSP);

-- End of file.


insert into Khach_Hang (MaKH,HoTen,DiaChi,SoDienThoai,Email)
Values ('KH01', N'Lê Hoàng Thanh Quý', 'Quan 7 HCM', 01699380933, 'quylhtps03318@fpt.edu.vn'),
('KH02', N'Đinh Điền An', 'Quan 10 HCM', 01211231321, 'Anddps03332@fpt.edu.vn'),
('KH03', N'Phạm Nhật Trường', N'Tân Bình HCM', 01612142131, 'Truongpn@fpt.edu.vn'),
('KH04', N'Nguyễn Tiến Minh', 'Biên Hoà, Đồng Nai', 01231098632, 'Minhnt@fpt.edu.vn'),
('KH05', N'Đỗ Quí Đạt', N'Bình Thạnh, HCM', 01231467321, 'Datdq@fpt.edu.vn')

Select * from Khach_Hang

insert into HoaDon(MaHD,NgayLapHD,TenCongTy,HoaDon_MaHD,Khach_Hang_MaKH)
values ('HD1','20160101',' ','01', 'KH01'),
('HD02','20161102','CT TNHH','02', 'KH01'),
('HD03','20160501',' ','03', 'KH02'),
('HD04','20160809',' ','04', 'KH05'),
('HD05','20161229',' ','05', 'KH03')

select * from HoaDon

insert into LoaiSP
values ('L01', N'Smart Phone'),
('L02', N'Windows Phone'),
('L03', N'AndroidPhone'),
('L04', N'I Phone'),
('L05', N'BlackBerryOS')

select * from LoaiSP

insert into SanPham
values ('SP01', N'Nokia Lumia 1520', 16000000, N'Cái', 'L02'),
('SP02', N'Nokia Lumia 990', 12000000, N'Cái', 'L02'),
('SP03', N'I phone 7', 123000000, N'Cái', 'L04'),
('SP04', N'Sony Z5', 13000000, N'Cái', 'L03'),
('SP05', N'BlackberryOS z10', 15000000, N'Cái', 'L01')

select * from SanPham

insert into HoaDonCT(MaHD,MaSP,SoLuong,HoaDon_MaHD,SanPham_MaSP)
values ('HD1', 'SP001', 2, 'HD1','SP01'),
('HD02', 'SP002', 4,'HD02','SP02'),
('HD03', 'SP004', 1,'HD03','SP04'),
('HD04', 'SP005', 2,'HD04','SP05'),
('HD05', 'SP006', 5,'HD05','SP03')

Select * from HoaDonCT

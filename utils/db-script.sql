DROP SCHEMA IF EXISTS dura_app;
CREATE DATABASE dura_app;

USE dura_app;

CREATE TABLE phongban 
(
	MaPhong bigint primary key auto_increment,
	SoLuong bigint
);

CREATE TABLE nhanvien
(
	MaNV varchar(20) primary key,
	Avatar text,
	HoTen text,
	NgaySinh datetime,
	GioiTinh boolean,
	SDT text,
	CMND text,
	Email text,
	ChucVu text,
	LoaiNV bigint,
	DiaChi text,
	QueQuan text,
	BHXH text,
	BHYT text,
	Luong double,
	Phong bigint,
	TaiKhoan bigint
);

CREATE TABLE loainhanvien 
(
	MaLoaiNV bigint primary key auto_increment,
	TenLoai text
);

CREATE TABLE chucnang
(
	MaCN bigint primary key auto_increment,
	TenCN text,
	LoaiCN int
);

CREATE TABLE vaitro
(
	MaVT bigint primary key auto_increment,
	TenVT text
);

CREATE TABLE ctvaitro 
(
	MaVT bigint,
	MaCN bigint,
    PRIMARY KEY (MaVT, MaCN)
);

CREATE TABLE taikhoan
(
	MaTK bigint primary key auto_increment,
	TaiKhoan text,
	MatKhau text,
	TrangThai boolean,
	LoaiTK int,
	VaiTro bigint
);

CREATE TABLE thanhvien
(
	MaTV bigint primary key auto_increment,
	HoTen text,
	Avatar text,
	DiaChi text,
	GioiTinh boolean,
	SDT text,
	TaiKhoan bigint
);

CREATE TABLE quantrivien
(
	MaQTV bigint primary key auto_increment,
	HoTen text,
	Avatar text,
	DiaChi text,
	GioiTinh boolean,
	SDT text,
	TaiKhoan bigint
);

CREATE TABLE khoahoc 
(
	MaKH bigint primary key auto_increment,
	TenKH text,
	SoLuongBai bigint,
	ThoiGianTao datetime,
	ThoiGianCapNhat datetime,
	SoLuongHV bigint,
	DanhGia double,
	DanhMuc bigint, 
	ChungChi bigint
);

CREATE TABLE khoahocngoai
(
	MaKH bigint primary key,
	Gia double,
	GiaUuDai double,
	NgayHetHan datetime
);

CREATE TABLE khoahocnoibo
(
	MaKH bigint primary key,
	ThoiGianKetThuc datetime
);

CREATE TABLE chungchi 
(
	MaCC bigint primary key auto_increment,
	HinhAnh text,
	MoTa text
);

CREATE TABLE tailieu
(
	MaTL bigint primary key auto_increment,
	TenTL text,
	NguonTL text,
	KhoaHoc bigint
);

CREATE TABLE danhmuc
(
	MaDanhMuc bigint primary key auto_increment,
	TenDanhMuc text,
	HinhAnh text,
	SoLuongKH bigint,
	DanhMucCon bigint
);

CREATE TABLE cauhoi
(
	MaCau bigint primary key auto_increment,
	CauHoi text,
	DapAn bigint,
	KhoaHoc bigint,
	DoKho int
);

CREATE TABLE dapan
(
	MaDapAn bigint primary key auto_increment,
	DapAn text,
	CauHoi bigint
);

CREATE TABLE baikiemtra 
(
	MaBaiKT bigint primary key auto_increment,
	TenBaiKT text,
	ThoiGianLam bigint,
	SoLuongCau bigint,
	KhoaHoc bigint
);

CREATE TABLE ctbaikiemtra
(
	MaBaiKT bigint,
	CauHoi bigint,
    PRIMARY KEY (MaBaiKT, CauHoi)
);

CREATE TABLE lichsukiemtra
(
	TaiKhoan bigint, 
	BaiKT bigint,
	NgayThucHien datetime,
	ThoiGianLamBai double,
	SoCauDung bigint,
    PRIMARY KEY (TaiKhoan, BaiKT)
);

CREATE TABLE ctdanhgia
(
	TaiKhoan bigint,
	KhoaHocNgoai bigint,
	BinhLuan text,
	Diem double,
    PRIMARY KEY (TaiKhoan, KhoaHocNgoai)
);

CREATE TABLE ctdangky 
(
	TaiKhoan bigint,
	KhoaHocNgoai bigint,
	NgayDangKy datetime,
	ThanhToan text,
	GiaUuDai double,
    PRIMARY KEY (TaiKhoan, KhoaHocNgoai)
);

CREATE TABLE danhsachyeuthich
(
	TaiKhoan bigint,
	KhoaHocNgoai bigint,
    PRIMARY KEY (TaiKhoan, KhoaHocNgoai)
);

CREATE TABLE uudai 
(
	MaUuDai varchar(20) primary key,
	MoTa text,
	LoaiUuDai int,
	GiamGia double,
	HetHan datetime,
	SoLuong bigint,
	KhoaHocNgoai bigint
);

CREATE TABLE lichsudunguudai
(
	TaiKhoan bigint,
	MaUuDai varchar(20),
	NgaySuDung datetime,
    PRIMARY KEY (TaiKhoan, MaUuDai)
);

ALTER TABLE nhanvien
ADD CONSTRAINT PK_nhanvien_loainhanvien FOREIGN KEY (LoaiNV) REFERENCES loainhanvien(MaLoaiNV) ON DELETE CASCADE;

ALTER TABLE nhanvien
ADD CONSTRAINT PK_nhanvien_phongban FOREIGN KEY (Phong) REFERENCES phongban(MaPhong) ON DELETE CASCADE;

ALTER TABLE nhanvien
ADD CONSTRAINT PK_nhanvien_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE ctvaitro
ADD CONSTRAINT PK_ctvaitro_vaitro FOREIGN KEY (MaVT) REFERENCES vaitro(MaVT) ON DELETE CASCADE;

ALTER TABLE ctvaitro
ADD CONSTRAINT PK_ctvaitro_chucnang FOREIGN KEY (MaCN) REFERENCES chucnang(MaCN) ON DELETE CASCADE;

ALTER TABLE taikhoan
ADD CONSTRAINT PK_taikhoan_vaitro FOREIGN KEY (VaiTro) REFERENCES vaitro(MaVT) ON DELETE CASCADE;

ALTER TABLE thanhvien
ADD CONSTRAINT PK_thanhvien_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE quantrivien
ADD CONSTRAINT PK_quantrivien_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE khoahoc
ADD CONSTRAINT PK_khoahoc_danhmuc FOREIGN KEY (DanhMuc) REFERENCES danhmuc(MaDanhMuc) ON DELETE CASCADE;

ALTER TABLE khoahoc
ADD CONSTRAINT PK_khoahoc_chungchi FOREIGN KEY (ChungChi) REFERENCES chungchi(MaCC) ON DELETE CASCADE;

ALTER TABLE khoahocngoai
ADD CONSTRAINT PK_khoahocngoai_khoahoc FOREIGN KEY (MaKH) REFERENCES khoahoc(MaKH) ON DELETE CASCADE;

ALTER TABLE khoahocnoibo
ADD CONSTRAINT PK_khoahocnoibo_khoahoc FOREIGN KEY (MaKH) REFERENCES khoahoc(MaKH) ON DELETE CASCADE;

ALTER TABLE tailieu
ADD CONSTRAINT PK_tailieu_khoahoc FOREIGN KEY (KhoaHoc) REFERENCES khoahoc(MaKH) ON DELETE CASCADE;

ALTER TABLE danhmuc
ADD CONSTRAINT PK_danhmuc FOREIGN KEY (DanhMucCon) REFERENCES danhmuc(MaDanhMuc) ON DELETE CASCADE;

ALTER TABLE cauhoi
ADD CONSTRAINT PK_cauhoi_dapan FOREIGN KEY (DapAn) REFERENCES dapan(MaDapAn) ON DELETE CASCADE;

ALTER TABLE cauhoi
ADD CONSTRAINT PK_cauhoi_khoahoc FOREIGN KEY (KhoaHoc) REFERENCES khoahoc(MaKH) ON DELETE CASCADE;

ALTER TABLE dapan
ADD CONSTRAINT PK_dapan_cauhoi FOREIGN KEY (CauHoi) REFERENCES cauhoi(MaCau) ON DELETE CASCADE;

ALTER TABLE baikiemtra
ADD CONSTRAINT PK_baikiemtra_khoahoc FOREIGN KEY (KhoaHoc) REFERENCES khoahoc(MaKH) ON DELETE CASCADE;

ALTER TABLE ctbaikiemtra
ADD CONSTRAINT PK_ctbaikiemtra_baikiemtra FOREIGN KEY (MaBaiKT) REFERENCES baikiemtra(MaBaiKT) ON DELETE CASCADE;

ALTER TABLE ctbaikiemtra
ADD CONSTRAINT PK_ctbaikiemtra_cauhoi FOREIGN KEY (CauHoi) REFERENCES cauhoi(MaCau) ON DELETE CASCADE;

ALTER TABLE lichsukiemtra
ADD CONSTRAINT PK_lichsukiemtra_baikiemtra FOREIGN KEY (BaiKT) REFERENCES baikiemtra(MaBaiKT) ON DELETE CASCADE;

ALTER TABLE lichsukiemtra
ADD CONSTRAINT PK_lichsukiemtra_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE ctdanhgia
ADD CONSTRAINT PK_ctdanhgia_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE ctdanhgia
ADD CONSTRAINT PK_ctdanhgia_khoahocngoai FOREIGN KEY (KhoaHocNgoai) REFERENCES khoahocngoai(MaKH) ON DELETE CASCADE;

ALTER TABLE ctdangky
ADD CONSTRAINT PK_ctdangky_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE ctdangky
ADD CONSTRAINT PK_ctdangky_khoahocngoai FOREIGN KEY (KhoaHocNgoai) REFERENCES khoahocngoai(MaKH) ON DELETE CASCADE;

ALTER TABLE uudai
ADD CONSTRAINT PK_uudai_khoahocngoai FOREIGN KEY (KhoaHocNgoai) REFERENCES khoahocngoai(MaKH) ON DELETE CASCADE;

ALTER TABLE lichsudunguudai
ADD CONSTRAINT PK_lichsudunguudai_taikhoan FOREIGN KEY (TaiKhoan) REFERENCES taikhoan(MaTK) ON DELETE CASCADE;

ALTER TABLE lichsudunguudai
ADD CONSTRAINT PK_lichsudunguudai_uudai FOREIGN KEY (MaUuDai) REFERENCES uudai(MaUuDai) ON DELETE CASCADE;
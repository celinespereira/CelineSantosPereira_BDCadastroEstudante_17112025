create database bd_cadastro_estudante;

use bd_cadastro_estudante;


create table tb_universidade(
cd_universidade int auto_increment primary Key,
nm_universidade varchar(45)
);

create table tb_horario(
cd_horario int auto_increment primary key,
hr_curso time not null,
dd_dia smallint
);


create table tb_faculdade(
cd_faculdade int auto_increment primary key,
nm_faculdade varchar(45) not null,
nm_endereco varchar(45),
nr_endereco int,
nm_bairro varchar(45), 
nm_cidade varchar(45),
fk_cd_universidade int,
foreign key(fk_cd_universidade) references tb_universidade(cd_universidade)
);

create table tb_curso(
cd_curso int auto_increment primary key,
nm_curso varchar(45) not null,
nr_semestre int,
nm_turno varchar(45),
fk_cd_horario int,
fk_cd_faculdade int,
foreign key (fk_cd_horario) references tb_horario(cd_horario),
foreign key (fk_cd_faculdade) references tb_faculdade (cd_faculdade)
);

create table tb_estudante (
cpf_estudante char(11) primary Key,
nm_estudante varchar(60) not null,
dt_nascimento date not null,
nm_endereco varchar(45) not null,
nr_endereco int not null,
email_estudante varchar(45) not null,
rg_estudante varchar(9) not null,
fk_cd_curso int,
foreign key (fk_cd_curso) references tb_curso (cd_curso)
);

create table tb_telefone(
nr_telefone char(13) primary key,
fk_cpf_estudante char(11),
foreign key (fk_cpf_estudante) references tb_estudante(cpf_estudante)
);

create table tb_cadastro(
cd_cadastro int auto_increment primary key,
dt_cadastro date,
fk_cpf_estudante char(11),
foreign key (fk_cpf_estudante) references tb_estudante(cpf_estudante)
);


/*- Alterar dt_cadastro para NOT NULL*/
ALTER TABLE TB_CADASTRO
MODIFY dt_cadastro DATE NOT NULL;


/*- Alterar email_estudante para VARCHAR(60)*/
alter table tb_estudante
modify email_estudante varchar(60) not null;


/*- Acrescentar na tabela Universidade o campo id_publica 
com o tipo de dado BIT e o valor DEFAULT 0 (zero)*/
alter table tb_universidade
add id_publica bit default 0;


/*- Colocar todos os dados de endereço da Faculdade como NOT NULL*/
alter table tb_faculdade
modify nm_endereco varchar(45) not null,
modify nr_endereco int not null,
modify nm_bairro varchar(45) not null,
modify nm_cidade varchar(45) not null;


INSERT INTO tb_universidade (nm_universidade, id_publica)
VALUES 
('Universidade Federal do Rio de Janeiro', 1),
('Universidade de São Paulo', 1),
('Universidade Estácio de Sá', 0);

INSERT INTO tb_faculdade (nm_faculdade, nm_endereco, nr_endereco, nm_bairro, nm_cidade, fk_cd_universidade)
VALUES
('Faculdade de Engenharia', 'Av. Central', 100, 'Centro', 'Rio de Janeiro', 1),
('Faculdade de Medicina', 'Rua Saúde', 200, 'Botafogo', 'Rio de Janeiro', 1),
('Faculdade de Direito', 'Av. Justiça', 150, 'São Paulo', 'São Paulo', 2),
('Faculdade de Ciências', 'Rua Saber', 50, 'Vila Mariana', 'São Paulo', 2),
('Faculdade de Artes', 'Av. Cultura', 120, 'Copacabana', 'Rio de Janeiro', 3),
('Faculdade de Computação', 'Rua Algoritmo', 75, 'Ipanema', 'Rio de Janeiro', 3),
('Faculdade de Administração', 'Av. Negócios', 300, 'Jardins', 'São Paulo', 2),
('Faculdade de Educação Física', 'Rua Movimento', 90, 'Leblon', 'Rio de Janeiro', 1);

INSERT INTO tb_horario (hr_curso, dd_dia)
VALUES
('08:00:00', 1),
('10:00:00', 1),
('14:00:00', 2),
('16:00:00', 2),
('09:00:00', 3),
('11:00:00', 3),
('13:00:00', 4),
('15:00:00', 4),
('08:30:00', 5),
('10:30:00', 5);

INSERT INTO tb_curso (nm_curso, nr_semestre, nm_turno, fk_cd_horario, fk_cd_faculdade)
VALUES
('Engenharia Civil', 10, 'Manhã', 1, 1),
('Engenharia Mecânica', 10, 'Tarde', 2, 1),
('Medicina', 12, 'Manhã', 3, 2),
('Enfermagem', 8, 'Tarde', 4, 2),
('Direito', 10, 'Noite', 5, 3),
('Ciências Contábeis', 8, 'Manhã', 6, 4),
('Biologia', 8, 'Tarde', 7, 4),
('Artes Visuais', 6, 'Noite', 8, 5),
('Design Gráfico', 6, 'Manhã', 9, 5),
('Ciência da Computação', 8, 'Tarde', 10, 6),
('Sistemas de Informação', 8, 'Noite', 1, 6),
('Administração', 8, 'Manhã', 2, 7),
('Marketing', 8, 'Tarde', 3, 7),
('Educação Física', 6, 'Noite', 4, 8),
('Fisioterapia', 8, 'Manhã', 5, 8),
('Psicologia', 10, 'Tarde', 6, 3),
('Jornalismo', 8, 'Noite', 7, 5),
('Arquitetura', 10, 'Manhã', 8, 1),
('Engenharia Elétrica', 10, 'Tarde', 9, 1),
('Nutrição', 8, 'Noite', 10, 2);

INSERT INTO tb_estudante (cpf_estudante, nm_estudante, dt_nascimento, nm_endereco, nr_endereco, email_estudante, rg_estudante, fk_cd_curso)
VALUES
('12345678901','Ana Silva','2000-01-15','Rua das Flores',10,'ana.silva@email.com','123456789',1),
('23456789012','Bruno Souza','1999-05-22','Av. Central',100,'bruno.souza@email.com','234567890',2),
('34567890123','Carla Lima','2001-07-10','Rua da Paz',45,'carla.lima@email.com','345678901',3),
('45678901234','Daniel Costa','2000-03-18','Rua do Sol',78,'daniel.costa@email.com','456789012',4),
('56789012345','Eduardo Alves','1998-11-30','Av. Brasil',200,'eduardo.alves@email.com','567890123',5),
('67890123456','Fernanda Martins','2001-02-25','Rua Nova',55,'fernanda.martins@email.com','678901234',6),
('78901234567','Gustavo Rocha','1999-09-12','Av. das Nações',120,'gustavo.rocha@email.com','789012345',7),
('89012345678','Helena Ferreira','2000-08-20','Rua Primavera',33,'helena.ferreira@email.com','890123456',8),
('90123456789','Igor Mendes','2001-06-05','Rua das Acácias',67,'igor.mendes@email.com','901234567',9),
('01234567890','Juliana Pinto','1998-12-15','Av. Vitória',88,'juliana.pinto@email.com','012345678',10),
('11223344556','Karina Santos','2000-04-22','Rua do Comércio',77,'karina.santos@email.com','112233445',11),
('22334455667','Leonardo Cardoso','1999-10-11','Rua Bela Vista',12,'leonardo.cardoso@email.com','223344556',12),
('33445566778','Mariana Rocha','2001-01-30','Av. das Palmeiras',90,'mariana.rocha@email.com','334455667',13),
('44556677889','Nicolas Lima','2000-07-08','Rua das Laranjeiras',101,'nicolas.lima@email.com','445566778',14),
('55667788990','Olivia Moreira','1998-05-14','Av. Jardim',150,'olivia.moreira@email.com','556677889',15),
('66778899001','Paulo Henrique','2001-03-25','Rua dos Jasmins',200,'paulo.henrique@email.com','667788990',16),
('77889900112','Quésia Teixeira','2000-09-02','Av. Horizonte',110,'quesia.teixeira@email.com','778899001',17),
('88990011223','Rafael Costa','1999-11-20','Rua do Lago',33,'rafael.costa@email.com','889900112',18),
('99001122334','Sabrina Gomes','2001-06-15','Av. Liberdade',99,'sabrina.gomes@email.com','990011223',19),
('10111213141','Thiago Oliveira','2000-02-28','Rua Esperança',44,'thiago.oliveira@email.com','101112131',20),
('12131415161','Valéria Ramos','1999-08-09','Av. Primavera',77,'valeria.ramos@email.com','121314151',1),
('13141516171','William Souza','2001-05-20','Rua do Sol',88,'william.souza@email.com','131415161',2),
('14151617181','Xavier Lima','2000-12-05','Av. das Flores',12,'xavier.lima@email.com','141516171',3),
('15161718191','Yasmin Martins','1999-03-18','Rua Nova',45,'yasmin.martins@email.com','151617181',4),
('16171819201','Zoe Ferreira','2001-09-22','Av. Vitória',60,'zoe.ferreira@email.com','161718192',5),
('17181920211','André Pinto','2000-04-12','Rua das Palmeiras',33,'andre.pinto@email.com','171819202',6),
('18192021221','Beatriz Cardoso','1998-07-30','Av. Horizonte',77,'beatriz.cardoso@email.com','181920212',7),
('19202122231','Caio Rocha','2001-01-09','Rua Bela Vista',88,'caio.rocha@email.com','192021222',8),
('20212223241','Débora Santos','2000-11-25','Av. Brasil',101,'debora.santos@email.com','202122232',9),
('21222324251','Enzo Almeida','1999-06-18','Rua do Comércio',50,'enzo.almeida@email.com','212223242',10);

INSERT INTO tb_telefone (nr_telefone, fk_cpf_estudante)
VALUES
('5521987654321','12345678901'),
('5521987654322','23456789012'),
('5521987654323','34567890123'),
('5521987654324','45678901234'),
('5521987654325','56789012345'),
('5521987654326','67890123456'),
('5521987654327','78901234567'),
('5521987654328','89012345678'),
('5521987654329','90123456789'),
('5521987654330','01234567890'),
('5521987654331','11223344556'),
('5521987654332','22334455667'),
('5521987654333','33445566778'),
('5521987654334','44556677889'),
('5521987654335','55667788990'),
('5521987654336','66778899001'),
('5521987654337','77889900112'),
('5521987654338','88990011223'),
('5521987654339','99001122334'),
('5521987654340','10111213141'),
('5521987654341','12131415161'),
('5521987654342','13141516171'),
('5521987654343','14151617181'),
('5521987654344','15161718191'),
('5521987654345','16171819201');

INSERT INTO tb_cadastro (dt_cadastro, fk_cpf_estudante)
VALUES
('2026-01-10','12345678901'),
('2026-01-11','23456789012'),
('2026-01-12','34567890123'),
('2026-01-13','45678901234'),
('2026-01-14','56789012345'),
('2026-01-15','67890123456'),
('2026-01-16','78901234567'),
('2026-01-17','89012345678'),
('2026-01-18','90123456789'),
('2026-01-19','01234567890'),
('2026-01-20','11223344556'),
('2026-01-21','22334455667'),
('2026-01-22','33445566778'),
('2026-01-23','44556677889'),
('2026-01-24','55667788990'),
('2026-01-25','66778899001'),
('2026-01-26','77889900112'),
('2026-01-27','88990011223'),
('2026-01-28','99001122334'),
('2026-01-29','10111213141'),
('2026-01-30','12131415161'),
('2026-01-31','13141516171'),
('2026-02-01','14151617181'),
('2026-02-02','15161718191'),
('2026-02-03','16171819201'),
('2026-02-04','17181920211'),
('2026-02-05','18192021221'),
('2026-02-06','19202122231'),
('2026-02-07','20212223241'),
('2026-02-08','21222324251');

DELETE FROM tb_cadastro
WHERE cd_cadastro = 3;

UPDATE tb_telefone
SET nr_telefone = '1399147856'
WHERE nr_telefone = '+5521987654330';

UPDATE tb_curso
SET nm_curso = 'Enfermagem'
WHERE cd_curso = 7;


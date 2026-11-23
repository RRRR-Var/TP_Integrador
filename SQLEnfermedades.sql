drop database if exists enfermedadesArg;
create database enfermedadesArg;
use enfermedadesArg;

create table tratamiento (
id int not null primary key,
nombre varchar(45)
);

create table complicaciones (
id int not null primary key,
nombre varchar(45)
);

create table prevencion (
id int not null primary key,
nombre varchar(45)
);

create table enfermedades(
idEnf int not null primary key,
nombre varchar(45),
causa varchar(90),
frequencia int,
muertes int,

idTrat int,
idComp int,
idPrevPrimaria int,
idPrevSecundaria int,
constraint fkTrat foreign key (idTrat) references tratamiento(id),
constraint fkComp foreign key (idComp) references complicaciones(id),
constraint fkPrev1 foreign key (idPrevPrimaria) references prevencion(id),
constraint fkPrev2 foreign key (idPrevSecundaria) references prevencion(id)
);

create table epidemia (
idEpidemia int not null primary key,
inicio date,
fin date,
idEnf int,
CONSTRAINT fkEnf FOREIGN KEY (idEnf) REFERENCES enfermedades(idEnf)
);

insert into prevencion values (1, "Vacunación");
insert into prevencion values (2, "Aislamiento");
insert into prevencion values (3, "Mantener un ambiente saludable");

insert into tratamiento values (1, "Inhibidores");
insert into tratamiento values (2, "Antivirales");

insert into complicaciones values (1, "Fiebre");
insert into complicaciones values (2, "Neumonia");

insert into enfermedades values (1, "Dengue", "Picadura del Mosquito Aedes Aegypti", 333084, 238, null, 1, 1, 3);
insert into enfermedades values (2, "Gripe A", "Virus de la familia Orthomyxoviridae", 1678817, 19274, 1, 2, 1, 2);
insert into enfermedades values (3, "Covid-19", "Virus SARS-COV-2", 692996986, 7000000, 2, 2, 1, 2);

insert into epidemia values (1, "2023-07-30", "2024-07-28", 1);
insert into epidemia values (2, "2009-01-31", "2009-06-11", 2);
insert into epidemia values (3, "2019-12-31", "2023-05-05", 3);

select nombre, muertes from enfermedades;
select nombre as enfermedadesVirales from enfermedades where causa like "%Virus%";
select nombre as enfermedadesSinTratamiento from enfermedades where idTrat IS NULL;

select enfermedades.nombre, enfermedades.frequencia, concat(-datediff(epidemia.inicio, epidemia.fin), " dias") as duracion
from enfermedades
left join epidemia on enfermedades.idEnf = epidemia.idEnf;

select enfermedades.nombre, enfermedades.muertes, complicaciones.nombre as complicaciones
from enfermedades
right join complicaciones on enfermedades.idComp = complicaciones.id;
use jugadores;

select j.jugador_id,
       j.nombre
  from formacion f,
       formacion_jugador fj,
       jugadores j
 where f.equipo_id = 1
   and f.formacion_id = fj.formacion_id
   and fj.jugador_id = j.jugador_id;

-- Otro query parecido
select * 
  from equipos e,
       formacion f,
       formacion_jugador fj,
       jugadores j
 where e.nombre = 'Boca'       
   and e.equipo_id = f.equipo_id
   and fj.formacion_id = f.formacion_id
   and j.jugador_id = fj.jugador_id;
   
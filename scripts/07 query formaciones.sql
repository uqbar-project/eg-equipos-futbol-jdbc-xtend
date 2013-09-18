select j.jugador_id,
       j.nombre
  from formacion f,
       formacion_jugador fj,
       jugadores j
 where f.equipo_id = 1
   and f.formacion_id = fj.formacion_id
   and fj.jugador_id = j.jugador_id
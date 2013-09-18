select eq_loc.equipo_id as idEquipoLocal,
			       eq_loc.nombre as nombreEquipoLocal,
			       for_loc.goles as golesLocal,
			       eq_vis.equipo_id as idEquipoVisitante,
			       eq_vis.nombre as nombreEquipoVisitante,
			       for_vis.goles as golesVisitante
  from partidos p,
       formacion for_loc,
       formacion for_vis,
       equipos eq_loc,
       equipos eq_vis
 where p.formacion_local_id = for_loc.formacion_id
   and for_loc.equipo_id = eq_loc.equipo_id
   and p.formacion_visitante_id = for_vis.formacion_id
   and for_vis.equipo_id = eq_vis.equipo_id
   
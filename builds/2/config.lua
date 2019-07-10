intervals = { -- Unidad: segundos OJO: PUEDE DRENAR RECURSOS DEL SERVIDOR
	['save'] = 10, -- Cada cuanto tiempo se guarda la ultima posicion del vehiculo. Solamente debe ser util en caso de crasheos o desconexiones en vehiculo.
	['check'] = 15 -- Cada cuanto tiempo debe chequear si hay vehiculos despawneados.
}

-- Mantener intervalos cortos si esto se desactiva.
saveOnEnter = true -- El vehiculo se guarda justo al entrar?.
saveOnExit = true -- El vehiculo se guarda justo al salir?.

debugMode = true -- MODO DEBUG.
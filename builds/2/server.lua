-- Debug printer
function dprint(msg)
	if debugMode then
		print(msg)
	end
end

local vehicles = {} -- Tabla donde se guardan todos los datos de los vehiculos.

-- Evento para reemplazar la ID del coche despawneado por el nuevo.
RegisterServerEvent('sd:updateId')
AddEventHandler('sd:updateId', function(oldId, newId)
	for i=1,#vehicles,1 do
		if vehicles[i].id == oldId then
			vehicles[i].id = newId
		end
	end
end)

-- Completa/ejecuta la inserción añadiendo los detalles del vehiculo.
function insert(index, id, model, x, y, z, heading)
	vehicles[index] = {
		['id'] = id,
		['model'] = model,
		['position'] = {
			['x'] = x,
			['y'] = y,
			['z'] = z
		},
		['heading'] = heading
	}
end

-- Evento para evaluar donde debe guardarse la tupla en la tabla.
RegisterServerEvent('sd:save')
AddEventHandler('sd:save', function(id, model, x, y, z, heading)
	if vehicles[1] then
		for i=1,#vehicles,1 do
			if vehicles[i].id == id then
				insert(i, id, model, x, y, z, heading)
				dprint(model .. '(' .. id ..')' .. '¡actualizado!')
				break
			elseif i == #vehicles then
				insert(#vehicles+1, id, model, x, y, z, heading)
				dprint(model .. '(' .. id ..')' .. '¡añadido!')
			end
		end
	else
		insert(#vehicles+1, id, model, x, y, z, heading)
		dprint(model .. '(' .. id ..')' .. '¡añadido!')
	end
end)

RegisterServerEvent('sd:retrieveTable')
AddEventHandler('sd:retrieveTable', function()
	dprint('Checking vehicles...')
	TriggerClientEvent('sd:checkVehs', GetPlayers()[1], vehicles)
end)

AddEventHandler('EnteredVehicle')
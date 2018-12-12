<!--#Include File="JSON_2.0.2.asp"-->
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<%

    'o querystring apanha ainformação que está

    'agarrada na barra de endereço
    apanha_url = Request.querystring("url")
	miniPc = Request.querystring("miniPc")

	'SE CASO ESTIVE LIST NA URL O PADRÃO DE BUSCA SERÁ DE PLAYLIST
	if(InStr(apanha_url,"list") <> 0)then
		tipo_de_busca = "playlist"
	end if
	'SE CASO NÃO ESTIVER HTTPS NA URL O PADRÃO DE BUSCA SERÁ DE SEARCH
	if(InStr(apanha_url,"https") = 0)then
		tipo_de_busca = "search"
	end if
	'SE CASO A URL FOR DE APENAS UM VÍDEO O PADRÃO DE BUSCA SERÁ DE VIDEOID
	if((InStr(apanha_url,"list") = 0) and (InStr(apanha_url,"v") <> 0))then
		tipo_de_busca = "videoID"
	end if
	'SE CASO A URL FOR DE UM CANAL SERÁ O PADRÃO DE BUSCA SERÁ DE USER_UPLOADS
	if(InStr(apanha_url,"user") <> 0)then
		tipo_de_busca = "user_uploads"
	end	if
	


	'Declara váriavel
	Dim youtube
	Dim variavel_json
	
	'Seta Objeto
	Set youtube = jsObject()

	'Define valores
	youtube("url") = apanha_url
	youtube("list_type") = tipo_de_busca
	youtube("miniPc") = miniPc

	variavel_json = toJSON(youtube)
	
	Set youtube = Nothing
	
	Response.Write variavel_json

			
	'Setando objeto para escrever um arquivo no servidor
	Set objeto = CreateObject("Scripting.FileSystemObject")

	'nome do arquivo  a ser gravado 
	sArquivo = Server.MapPath ("youtube_"&miniPc&".json")
	
	Set gravaArquivo = objeto.CreateTextFile(sArquivo ,True)

	gravaArquivo.WriteLine(variavel_json)

	gravaArquivo.close

	set objeto = nothing

	set gravaArquivo = nothing

%>
<body onload="window.close();">
</body>
</html>

<!--#Include File="JSON_2.0.2.asp"-->
<%

    'o querystring apanha ainformação que está

    'agarrada na barra de endereço
    status = Request.querystring("status")

	step = Request.querystring("step")

	miniPC = Request.querystring("miniPC")


		Dim max,min
		max=100
		min=1
		Randomize
		nr = Int((max-min+1)*Rnd+min)
		
	
	'Declara váriavel
	Dim youtube
	Dim variavel_json
	
	'Seta Objeto
	Set youtube = jsObject()

	'Define valores
	youtube("status") = status
	youtube("step") = step
	youtube("random") = nr
	youtube("miniPC") = miniPC
	

	variavel_json = toJSON(youtube)
	
	Set youtube = Nothing

	
	response.write variavel_json
			
	'Setando objeto para escrever um arquivo no servidor
	Set objeto = CreateObject("Scripting.FileSystemObject")

	'nome do arquivo  a ser gravado 
	sArquivo = Server.MapPath ("controle_"& miniPC &".json")
	
	Set gravaArquivo = objeto.CreateTextFile(sArquivo ,True)

	gravaArquivo.WriteLine(variavel_json)

	gravaArquivo.close

	set objeto = nothing

	set gravaArquivo = nothing



	

%>
<script type="text/javascript">
//window.history.back();
</script>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body onload="window.close();">

</body>
</html>
var tempo = window.setInterval(carregaReservas, 2000);
function carregaReservas()
{
$('#conteudoReservas').load("controladoraReserva.jsp");
}
$(document).ready(function () {
    $('#canvas').click(function (event) {

        let width = $('#canvas').width();
        let height = $('#canvas').height();

        let r = $('input[type="radio"]:checked').val();

        if (!r) {
            $('circle').each(function () {
                $(this).attr("style", "stroke: red; stroke-width: 1.5;");
            });
            return;
        }

        let relativeX = event.pageX - $('#canvas').offset().left;
        let relativeY = event.pageY - $('#canvas').offset().top;

        let x = (relativeX - (width / 2)) / width * 3;
        let y = ((height / 2) - relativeY) / height * 3;
        document.getElementById("y").value = (y * r).toFixed(2);
        document.getElementById("xValue").value = (x * r).toFixed(2);

        $('#form').submit();
    });
});

$(document).ready(function () {

    function drawCircle(x, y, result) {
        if (result === 'true')
            ctx.fillStyle = 'rgb(255, 255, 255)';
        else
            ctx.fillStyle = "#3E97FF";
        ctx.beginPath();
        ctx.arc(x, y, 2.5, 0, Math.PI * 2);
        ctx.fill();
    }

    let canvas = $('#canvas');
    let ctx = canvas[0].getContext('2d');
    let rxp = /{([^}]+)}/g,
        curMatch;
    let width = canvas.width();
    let height = canvas.height();

    if ($("#canvas").attr('history')) {
        userAttempts = $("#canvas").attr('history');
        console.log(userAttempts);
        while (curMatch = rxp.exec(userAttempts)) {
            console.log(curMatch[1].replace(
                /'/g, "\""));
            obj = JSON.parse("{" + curMatch[1].replace(
                /'/g, "\"") + "}");
            let x = (width * (2 * obj.x + 3 * obj.r)) / (6 * obj.r);
            let y = (height * (3 * obj.r - 2 * obj.y)) / (6 * obj.r);

            drawCircle(x, y, obj.correct);
        }
    }

});

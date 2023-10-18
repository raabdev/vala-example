public class Application : Gtk.Window {
    public Application () {
        // Crea la interfaz de usuario
        set_title ("Suma");
        set_default_size (200, 300);
        set_border_width (10);
        
        var grid = new Gtk.Grid ();
        add (grid);
        
        var fieldNum1 = new Gtk.Entry ();
        var fieldNum2 = new Gtk.Entry ();
        var btnCalcular = new Gtk.Button.with_label ("Calcular");
        var labelResultado = new Gtk.Label ("");
        
        grid.attach (new Gtk.Label ("Número 1"), 0, 0, 1, 1);
        grid.attach (fieldNum1, 1, 0, 2, 1);
        grid.attach (new Gtk.Label ("Número 2"), 0, 1, 1, 1);
        grid.attach (fieldNum2, 1, 1, 2, 1);
        grid.attach (btnCalcular, 0, 2, 2, 1);
        grid.attach (new Gtk.Label ("Resultado:"), 0, 3, 1, 1);
        grid.attach (labelResultado, 1, 3, 2, 1);
        
        // Conecta el evento "clicked" del botón a la función de suma
        btnCalcular.clicked.connect (() => {
            int num1;
            int num2;
            
            try {
                num1 = int.parse (fieldNum1.text);
                num2 = int.parse (fieldNum2.text);
            } catch (ParseError e) {
                labelResultado.set_text ("Error: Los valores ingresados deben ser números");
                return;
            }
            
            var resultado = num1 + num2;
            labelResultado.set_text (resultado.to_string ());
        });
    }
    
    protected override void on_delete_event (DeleteEvent event) {
        Gtk.main_quit ();
    }
    
    public static int main (string[] args) {
        Gtk.init (ref args);
        
        var app = new Application ();
        app.show_all ();
        
        Gtk.main ();
        return 0;
    }
}

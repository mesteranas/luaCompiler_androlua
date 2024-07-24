require "import"
import "android.widget.*"
import "android.view.*"
layout={
    LinearLayout;
    {
        EditText;
        hint="type lua code";
        id="code"
    };
    {
        Button;
        text="run";
        onClick=function()
            local result,error=loadstring(code.getText().toString())
            if result then
                local success,output=pcall(result)
                resultText.setText(tostring(output))
            else
                resultText.setText(tostring(error))
            end
        end;
    };
    {
        TextView;
        id="resultText";
    }
}
dlg=activity
dlg.setTitle("lua compiler")
dlg.setContentView(loadlayout(layout))

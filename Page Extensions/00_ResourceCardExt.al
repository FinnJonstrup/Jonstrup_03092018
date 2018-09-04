pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
            }
            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
                {
                   
                }
        }

        addlast(Content)
        {
            group(Room)
            {
                 Visible = Showmaxfield;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {
                   
                }
                

            }
        }



    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAftergetrecord();
    begin
        showmaxfield := (rec.type = rec.type::Machine);
        CurrPage.Update(false);
    end;

    var
        [Indataset]
        showmaxfield: Boolean;
}
pageextension 123456701 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = Showtype;
        }
        addafter(type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Participants";"CSD Maximum Participants")
{
                Visible = ShowMaxfield;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        Showtype := (Getfilter(Type) = '');
        ShowMaxfield := (GetFilter(type)) = Format(Type::machine);
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowMaxfield: Boolean;
        [InDataSet]
        Showtype: Boolean;

}
with Text_IO;
procedure Hello_World is
   Unused_Counter : Integer := 42;  -- Magic number and unused variable
   Message:String:="Hello, World!";  -- Inconsistent spacing around operators
begin
  Text_IO.Put_Line(Message);
end Hello_World;

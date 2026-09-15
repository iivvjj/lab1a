with Ada.Text_IO;

package body Buffer is
   use Ada.Text_IO;
   protected body CircularBuffer is

      entry Put(X: Item) when Count < Size is
      begin
         A(In_Ptr) := X;
         In_Ptr := In_Ptr + 1;
         Count := Count + 1;
         if Count = Size then
            Put_Line("Buffer is full");
         end if;
      end Put;

      entry Get(X: out Item) when Count > 0 is
      begin
         X := A(Out_Ptr);
         Out_Ptr := Out_Ptr + 1;
         Count := Count - 1;
         if Count = 0 then
            Put_Line("Buffer is empty");
         end if;
      end Get;
   end CircularBuffer;
end Buffer;

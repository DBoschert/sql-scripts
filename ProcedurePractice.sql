create or alter PROCEDURE ListRequestsForUser
    @Username varchar(30) = NULL
as
BEGIN

    IF @Username is NULL 
    BEGIN
        --print '@Username must be a string';
        RETURN -1;
    END
        
    SELECT r.*
        from Users u
        join Requests r
            on u.Id = r.UserId
        where u.Username = @Username;
        
    return 0;
END

go
DECLARE @rc int;
exec @rc = ListRequestsForUser ;
if @rc = 0
    PRINT 'Everything is good!';
if @rc = -1 
    print '@Username must be a string';


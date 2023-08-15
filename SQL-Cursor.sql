BEGIN TRY
    DECLARE @index int = 1;
    SET @index = @index + 5;
    RAISERROR (100, 'Index is six');
END TRY
BEGIN CATCH

END CATCH




/*

DECLARE cur CURSOR FOR
SELECT Id, [Description] from Requests;

DECLARE @Id int, @Description varchar(80), @Total decimal(9,2);

OPEN cur;

FETCH NEXT FROM cur into @id, @Description;

While @@FETCH_STATUS = 0
BEGIN
    PRINT 'Request id is ' + str(@Id);

    select @Total = sum(rl.Quantity * p.Price)
        from RequestLine rl
        join Products p on p.id = rl.ProductId
        where rl.RequestID = @Id
        group by rl.RequestId;

    Update Requests Set 
    Total = @Total
    where Id = @id;

    FETCH NEXT FROM cur into @id, @Description;
END

CLOSE cur;

DEALLOCATE cur;


-- --------------------------

select r.[Description], sum(rl.Quantity * p.Price) Total
    from Requests r
    join RequestLine rl
        on r.Id = rl.RequestId
    join
        on p.id = rl.RequestId
    where r.Id in (1,2,3)
    group by r.id, r.[Description]
        


declare @counter int = 1, @sum int = 0;

WHILE @counter <= 20
BEGIN
     if @counter % 2 != 0
     BEGIN
        set @counter = @counter + 1;
        continue
    END

    Set @sum = @sum + @counter;
    set @counter = @counter + 1;
END

print 'The sim is ' + str(@sum);


DECLARE @counter int = 0;

WHILE @counter < 20
BEGIN
    if @counter = 7
        break;

    print 'The value of counter is ' + str(@counter);
    set @counter = @counter + 1;        

END


declare @name varchar(30) = 'Greg' + ' ' + 'Doud';

select @name

declare @color varchar(10) = 'red';

if @color = 'red'
    BEGIN
    print 'The color is red!';
    print 'The color is a deep red!';
    print 'The color is a very deep red!';
    END

else if @color = 'blue
    BEGIN

    END

else if @color = 'yellow'
    BEGIN

    END

print 'This should always display'

*/

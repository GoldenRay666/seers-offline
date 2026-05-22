.class public Le22/c55/s88/e/b;
.super Ljava/lang/Object;


# static fields
.field private static b:Le22/c55/s88/e/b;

.field private static f:Le22/c55/s88/e/f;


# instance fields
.field private a:Landroid/content/Context;

.field private c:I

.field private d:I

.field private e:Landroid/os/Handler;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Le22/c55/s88/e/b;->c:I

    const/4 v0, 0x0

    iput v0, p0, Le22/c55/s88/e/b;->d:I

    new-instance v0, Le22/c55/s88/e/c;

    invoke-direct {v0, p0}, Le22/c55/s88/e/c;-><init>(Le22/c55/s88/e/b;)V

    iput-object v0, p0, Le22/c55/s88/e/b;->e:Landroid/os/Handler;

    iput-object p1, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    return-void
.end method

.method public static a(I)I
    .locals 1

    const v0, 0x1080052

    packed-switch p0, :pswitch_data_0

    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    const v0, 0x108008e

    goto :goto_0

    :pswitch_2
    const v0, 0x108008f

    goto :goto_0

    :pswitch_3
    const v0, 0x108002b

    goto :goto_0

    :pswitch_4
    const v0, 0x1080093

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method static synthetic a(Le22/c55/s88/e/b;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Le22/c55/s88/e/b;
    .locals 1

    sget-object v0, Le22/c55/s88/e/b;->b:Le22/c55/s88/e/b;

    if-nez v0, :cond_0

    new-instance v0, Le22/c55/s88/e/b;

    invoke-direct {v0, p0}, Le22/c55/s88/e/b;-><init>(Landroid/content/Context;)V

    sput-object v0, Le22/c55/s88/e/b;->b:Le22/c55/s88/e/b;

    :cond_0
    sget-object v0, Le22/c55/s88/e/b;->b:Le22/c55/s88/e/b;

    return-object v0
.end method

.method protected static a(Landroid/content/Context;Le22/c55/s88/e/j;)V
    .locals 7

    const/4 v5, 0x1

    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-static {p0, p1}, Le22/c55/s88/e/b;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v1

    iget v0, p1, Le22/c55/s88/e/j;->F:I

    invoke-static {v0}, Le22/c55/s88/e/b;->a(I)I

    move-result v2

    iget v0, p1, Le22/c55/s88/e/j;->v:I

    if-ne v0, v5, :cond_0

    const/16 v4, 0x20

    :goto_1
    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-static/range {v0 .. v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Landroid/content/Intent;ILe22/c55/s88/e/j;IZZ)V

    goto :goto_0

    :cond_0
    sget v4, Le22/c55/s88/f/a;->a:I

    goto :goto_1

    :pswitch_2
    invoke-static {p0, p1}, Le22/c55/s88/Vaa;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Le22/c55/s88/e/f;)V
    .locals 0

    sput-object p0, Le22/c55/s88/e/b;->f:Le22/c55/s88/e/f;

    return-void
.end method

.method public static b(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-static {p0}, Le22/c55/s88/VManager;->getMainChildActivity(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/e/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    iget v2, p1, Le22/c55/s88/e/j;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bQ:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method public static c(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-static {p0}, Le22/c55/s88/VManager;->getMainChildActivity(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/e/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    iget v2, p1, Le22/c55/s88/e/j;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bQ:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bR:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method private c(Le22/c55/s88/e/j;)V
    .locals 6

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildReceivre(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    sget-object v1, Le22/c55/s88/f/e;->cB:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->cw:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    iget v2, p1, Le22/c55/s88/e/j;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/e/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    iget v2, p1, Le22/c55/s88/e/j;->h:I

    const/high16 v3, 0x8000000

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    iget-object v0, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    const-string v3, "alarm"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;)[Le22/c55/s88/e/j;

    move-result-object v0

    invoke-virtual {p0, v0}, Le22/c55/s88/e/b;->a([Le22/c55/s88/e/j;)V

    return-void
.end method

.method protected a(Le22/c55/s88/e/j;)V
    .locals 11

    const/4 v10, -0x3

    const/4 v9, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    const-string v0, "WIFI"

    iget-object v2, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Le22/c55/s88/e/j;->t:I

    if-eq v0, v6, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v0, Le22/c55/s88/b/f;

    iget-object v2, p1, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    sget-object v4, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget v5, p1, Le22/c55/s88/e/j;->h:I

    invoke-static {v3, v4, v5}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v2, v3, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v2, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v2, v0, v9}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    if-eq v0, v6, :cond_2

    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    const/4 v2, 0x3

    if-ne v0, v2, :cond_3

    :cond_2
    new-instance v0, Le22/c55/s88/b/f;

    iget-object v2, p1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {p1}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v4

    iget v5, p1, Le22/c55/s88/e/j;->h:I

    invoke-static {v3, v4, v5}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v2, v3, v6}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v2, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v2, v0, v9}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    :cond_3
    iget-object v0, p1, Le22/c55/s88/e/j;->r:Ljava/lang/String;

    const-string v2, ";"

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->a(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    array-length v3, v2

    move v0, v1

    :goto_0
    if-ge v0, v3, :cond_0

    new-instance v4, Le22/c55/s88/b/f;

    aget-object v5, v2, v0

    iget-object v6, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Le22/c55/s88/f/e;->x:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, p1, Le22/c55/s88/e/j;->h:I

    invoke-static {v6, v7, v8}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v6

    invoke-direct {v4, v5, v6, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v5, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v5, v4, v9}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public a(Ljava/io/InputStream;I)V
    .locals 7

    const/4 v6, 0x0

    const/4 v0, 0x0

    iput p2, p0, Le22/c55/s88/e/b;->c:I

    :try_start_0
    invoke-virtual {p0, p1}, Le22/c55/s88/e/b;->a(Ljava/io/InputStream;)[Le22/c55/s88/e/j;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_2

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_0
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/io/DataInputStream;->close()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "msgs size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/g;->a(Ljava/lang/Object;)V

    array-length v2, v1

    if-lez v2, :cond_3

    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-virtual {v2}, Le22/c55/s88/e/j;->b()V

    :cond_3
    const/4 v2, 0x4

    if-ne p2, v2, :cond_6

    sget-object v0, Le22/c55/s88/e/b;->f:Le22/c55/s88/e/f;

    if-eqz v0, :cond_4

    sget-object v0, Le22/c55/s88/e/b;->f:Le22/c55/s88/e/f;

    invoke-interface {v0, v1}, Le22/c55/s88/e/f;->a([Le22/c55/s88/e/j;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    :goto_1
    if-eqz v6, :cond_5

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_5
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/io/DataInputStream;->close()V

    goto :goto_0

    :cond_6
    const/4 v2, 0x7

    if-ne p2, v2, :cond_9

    :try_start_2
    sget-object v0, Le22/c55/s88/e/b;->f:Le22/c55/s88/e/f;

    if-eqz v0, :cond_4

    sget-object v0, Le22/c55/s88/e/b;->f:Le22/c55/s88/e/f;

    invoke-interface {v0, v1}, Le22/c55/s88/e/f;->a([Le22/c55/s88/e/j;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_3
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    if-eqz v6, :cond_7

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_7
    if-eqz v6, :cond_8

    invoke-virtual {v6}, Ljava/io/DataInputStream;->close()V

    :cond_8
    throw v0

    :cond_9
    :try_start_4
    array-length v2, v1

    :goto_2
    if-ge v0, v2, :cond_c

    aget-object v3, v1, v0

    iget-object v4, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v4, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    iget v4, v3, Le22/c55/s88/e/j;->U:I

    if-eqz v4, :cond_a

    iget v4, v3, Le22/c55/s88/e/j;->U:I

    iput v4, p0, Le22/c55/s88/e/b;->d:I

    :cond_a
    iget v4, v3, Le22/c55/s88/e/j;->A:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_b

    iget-object v4, v3, Le22/c55/s88/e/j;->H:Ljava/lang/String;

    invoke-static {v4}, Le22/c55/s88/f/a;->b(Ljava/lang/String;)Z

    iget v3, v3, Le22/c55/s88/e/j;->C:I

    int-to-long v3, v3

    invoke-static {v3, v4}, Le22/c55/s88/f/a;->a(J)V

    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_c
    invoke-virtual {p0, v1}, Le22/c55/s88/e/b;->a([Le22/c55/s88/e/j;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method protected varargs a([Le22/c55/s88/e/j;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, -0x1

    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/b/b;->a(Landroid/content/Context;)Le22/c55/s88/b/b;

    array-length v1, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p1, v0

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    if-ne v3, v5, :cond_3

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget-object v3, p0, Le22/c55/s88/e/b;->a:Landroid/content/Context;

    iget-object v4, v2, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v3, v4}, Le22/c55/s88/f/a;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget v3, v2, Le22/c55/s88/e/j;->A:I

    if-ne v3, v6, :cond_2

    :cond_4
    iget-object v3, v2, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v5, :cond_2

    invoke-virtual {p0, v2}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/j;)V

    iget v3, p0, Le22/c55/s88/e/b;->c:I

    if-eqz v3, :cond_5

    iget v3, p0, Le22/c55/s88/e/b;->c:I

    if-ne v3, v6, :cond_6

    :cond_5
    invoke-virtual {p0, v2}, Le22/c55/s88/e/b;->b(Le22/c55/s88/e/j;)V

    goto :goto_1

    :cond_6
    invoke-direct {p0, v2}, Le22/c55/s88/e/b;->c(Le22/c55/s88/e/j;)V

    goto :goto_1
.end method

.method public a(Ljava/io/InputStream;)[Le22/c55/s88/e/j;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v3, 0x200

    :try_start_2
    new-array v3, v3, [B

    :goto_0
    invoke-virtual {v1, v3}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->flush()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v6, v2

    move-object v2, v1

    move-object v1, v6

    :goto_1
    :try_start_3
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    move-object v6, v1

    move-object v1, v2

    move-object v2, v6

    :goto_2
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/util/zip/GZIPInputStream;->close()V

    :cond_1
    throw v0

    :cond_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    if-eqz v3, :cond_3

    array-length v4, v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-nez v4, :cond_6

    :cond_3
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_4
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/util/zip/GZIPInputStream;->close()V

    :cond_5
    :goto_3
    return-object v0

    :cond_6
    :try_start_5
    invoke-static {v3}, Le22/c55/s88/e/j;->a([B)[Le22/c55/s88/e/j;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result-object v0

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    :cond_7
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/util/zip/GZIPInputStream;->close()V

    goto :goto_3

    :catchall_1
    move-exception v1

    move-object v2, v0

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    goto :goto_2

    :catchall_2
    move-exception v1

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    goto :goto_2

    :catchall_3
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    move-object v2, v0

    move-object v6, v0

    move-object v0, v1

    move-object v1, v6

    goto :goto_1

    :catch_2
    move-exception v1

    move-object v6, v1

    move-object v1, v2

    move-object v2, v0

    move-object v0, v6

    goto :goto_1
.end method

.method public b()I
    .locals 1

    iget v0, p0, Le22/c55/s88/e/b;->d:I

    return v0
.end method

.method public b(Le22/c55/s88/e/j;)V
    .locals 2

    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Le22/c55/s88/e/b;->e:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

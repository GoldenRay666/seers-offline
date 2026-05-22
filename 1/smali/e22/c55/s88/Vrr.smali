.class public Le22/c55/s88/Vrr;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static a:Landroid/os/PowerManager$WakeLock;

.field static final b:Ljava/lang/Object;

.field static c:Landroid/os/PowerManager$WakeLock;

.field static final d:Ljava/lang/Object;

.field private static f:J

.field private static h:Ljava/util/Set;


# instance fields
.field private e:Landroid/content/Context;

.field private g:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Le22/c55/s88/Vrr;->b:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    sput-wide v0, Le22/c55/s88/Vrr;->f:J

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Le22/c55/s88/Vrr;->d:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Le22/c55/s88/Vrr;->h:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    new-instance v0, Le22/c55/s88/l;

    invoke-direct {v0, p0}, Le22/c55/s88/l;-><init>(Le22/c55/s88/Vrr;)V

    iput-object v0, p0, Le22/c55/s88/Vrr;->g:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Le22/c55/s88/Vrr;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    return-object v0
.end method

.method public static a()V
    .locals 2

    sget-object v1, Le22/c55/s88/Vrr;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    sget-object v0, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected static a(Landroid/app/Service;I)V
    .locals 2

    sget-object v1, Le22/c55/s88/Vrr;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/Service;->stopSelfResult(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected static a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    sget-object v1, Le22/c55/s88/Vrr;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v2, 0x1

    sget-object v3, Le22/c55/s88/f/e;->cC:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    sput-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    sget-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_0
    sget-object v0, Le22/c55/s88/Vrr;->a:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    invoke-static {p0}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic a(Le22/c55/s88/Vrr;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Le22/c55/s88/Vrr;->b(Landroid/content/Context;)V

    return-void
.end method

.method public static a(Le22/c55/s88/m;)V
    .locals 1

    sget-object v0, Le22/c55/s88/Vrr;->h:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 2

    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v0

    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le22/c55/s88/f/g;->a(Ljava/lang/Object;)V

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Le22/c55/s88/Vrr;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vrr;->g:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic b()Ljava/util/Set;
    .locals 1

    sget-object v0, Le22/c55/s88/Vrr;->h:Ljava/util/Set;

    return-object v0
.end method

.method private b(Landroid/content/Context;)V
    .locals 7

    const/16 v6, 0x5dc

    const/4 v5, 0x0

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-static {p1}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Le22/c55/s88/b/b;->a()Le22/c55/s88/b/b;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p1}, Le22/c55/s88/b/b;->a(Landroid/content/Context;)Le22/c55/s88/b/b;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Le22/c55/s88/b/b;->d()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_9

    const-string v2, "wifi"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/b/f;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->n()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_3

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->d(Landroid/content/Context;I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->aw:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->ax:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :cond_2
    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->p(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_5

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_4

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->d(Landroid/content/Context;I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->aw:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->ax:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :cond_4
    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto/16 :goto_0

    :cond_5
    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->j(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/c/e;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_1

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_6

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->d(Landroid/content/Context;I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->aw:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->ax:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :cond_6
    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto/16 :goto_0

    :cond_7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/b/f;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->n()I

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->m()Ljava/lang/String;

    move-result-object v2

    const-string v3, "wifi"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_c

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_8

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_a

    :cond_9
    return-void

    :cond_a
    if-eqz v2, :cond_b

    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    :cond_b
    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto :goto_1

    :cond_c
    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->p(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_e

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_d

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->d(Landroid/content/Context;I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->aw:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->ax:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :cond_d
    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto/16 :goto_1

    :cond_e
    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-virtual {v0}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->j(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/c/e;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v2

    if-eqz v2, :cond_8

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->c(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_f

    iget v3, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->d(Landroid/content/Context;I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->aw:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->ax:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    :cond_f
    new-instance v3, Le22/c55/s88/e/a;

    invoke-direct {v3, p1, v2, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    invoke-virtual {v0}, Le22/c55/s88/b/f;->g()V

    goto/16 :goto_1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    const/16 v5, 0x1388

    const/4 v4, 0x1

    iput-object p1, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Le22/c55/s88/f;

    invoke-direct {v1, p0}, Le22/c55/s88/f;-><init>(Le22/c55/s88/Vrr;)V

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->cA:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->i(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/c/e;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v2, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/c/e;)V

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    iget v3, v1, Le22/c55/s88/c/e;->e:I

    iput v3, v2, Landroid/os/Message;->arg1:I

    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput v4, v2, Landroid/os/Message;->what:I

    iget-object v1, p0, Le22/c55/s88/Vrr;->g:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Le22/c55/s88/g;

    invoke-direct {v2, p0, v0}, Le22/c55/s88/g;-><init>(Le22/c55/s88/Vrr;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    :cond_3
    if-nez v0, :cond_7

    sget-object v0, Le22/c55/s88/f/e;->cB:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v0, p2}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    :cond_4
    sget-object v1, Le22/c55/s88/f/e;->cw:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v1, Le22/c55/s88/Vrr;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_5

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v2, 0x1

    sget-object v3, Le22/c55/s88/f/e;->cx:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    sput-object v0, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    sget-object v0, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_5
    new-instance v0, Le22/c55/s88/e/j;

    invoke-direct {v0}, Le22/c55/s88/e/j;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/e/j;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    sget-object v2, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Le22/c55/s88/e/j;->f:I

    sget-object v2, Le22/c55/s88/Vrr;->c:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v2, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/e/b;->a(Landroid/content/Context;)Le22/c55/s88/e/b;

    move-result-object v2

    invoke-virtual {v2, v0}, Le22/c55/s88/e/b;->b(Le22/c55/s88/e/j;)V

    :cond_6
    monitor-exit v1

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_7
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Le22/c55/s88/Vrr;->f:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Le22/c55/s88/Vrr;->f:J

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->u(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Le22/c55/s88/Vrr;->g:Landroid/os/Handler;

    const-wide/16 v2, 0x2710

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Le22/c55/s88/h;

    invoke-direct {v1, p0}, Le22/c55/s88/h;-><init>(Le22/c55/s88/Vrr;)V

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto/16 :goto_0

    :cond_8
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vrr;->e:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->u(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Le22/c55/s88/j;

    invoke-direct {v1, p0}, Le22/c55/s88/j;-><init>(Le22/c55/s88/Vrr;)V

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto/16 :goto_0
.end method

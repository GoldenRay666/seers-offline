.class public Lcom/taomee/seer2/a/b/a;
.super Ljava/lang/Object;


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Ljava/lang/Class;

.field private c:Landroid/content/Context;

.field private d:Landroid/app/Service;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/taomee/seer2/a/Yg;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->c:Landroid/content/Context;

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->e:Ljava/lang/String;

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    iput-object p2, p0, Lcom/taomee/seer2/a/b/a;->c:Landroid/content/Context;

    iput-object p3, p0, Lcom/taomee/seer2/a/b/a;->e:Ljava/lang/String;

    iput-object p4, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    iput-object p1, p0, Lcom/taomee/seer2/a/b/a;->d:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    goto :goto_0
.end method

.method public a(Landroid/os/Bundle;)V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->c:Landroid/content/Context;

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/taomee/seer2/a/a/d;->a(Landroid/content/Context;Ljava/lang/String;)Ldalvik/system/DexClassLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/app/Service;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-class v4, Landroid/os/Bundle;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/taomee/seer2/a/b/a;->d:Landroid/app/Service;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/taomee/seer2/a/b/a;->c:Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    goto :goto_0

    :catch_5
    move-exception v0

    goto :goto_0

    :catch_6
    move-exception v0

    goto :goto_0
.end method

.method public b(Landroid/os/Bundle;)I
    .locals 6

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/taomee/seer2/a/b/a;->b:Ljava/lang/Class;

    iget-object v2, p0, Lcom/taomee/seer2/a/b/a;->f:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-static {v2, v3}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/os/Bundle;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v2, p0, Lcom/taomee/seer2/a/b/a;->a:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    :cond_0
    :goto_1
    move v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    goto :goto_1
.end method

.class public Lcom/taomee/seer2/a/c/a;
.super Ljava/lang/Object;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/taomee/seer2/a/c/a;->a:Ljava/lang/String;

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/taomee/seer2/a/c/a;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/taomee/seer2/a/c/a;->b:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lcom/taomee/seer2/a/c/b;
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/taomee/seer2/a/c/a;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/c/a;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/taomee/seer2/a/c/b;

    iget-object v2, p0, Lcom/taomee/seer2/a/c/a;->b:Lorg/json/JSONObject;

    invoke-interface {v0}, Lcom/taomee/seer2/a/c/b;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/taomee/seer2/a/c/a;->b:Lorg/json/JSONObject;

    invoke-interface {v0}, Lcom/taomee/seer2/a/c/b;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/taomee/seer2/a/c/b;->a(Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_2
    :goto_1
    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1
.end method
